comparison = require "./helpers/comparison"
contains = require "./helpers/contains"
equality = require "./helpers/equality"
existence = require "./helpers/existence"
length = require "./helpers/length"


validBlock =
  id: "0cefd9bc-5f03-480c-81fa-e85f788eec86"
  author: [
    name: "thegrid"
    url: "http://twitter.com/thegrid"
    avatar:
      src: "https://pbs.twimg.com/profile_images/519509422008049664/p5MmucQ-_400x400.png"
      width: 48
      height: 48
  ]

anotherValidBlock =
  id: "0cefd9bc-5f03-480c-81fa-e85f788eec87"
  author: [
    name: "thegridio"
    url: "http://twitter.com/thegridio"
    avatar:
      src: "https://pbs.twimg.com/profile_images/509869928695230464/sob_gOga_normal.jpeg"
      width: 72
      height: 72
  ]

blockWithoutAuthor =
  id: "0cefd9bc-5f03-480c-81fa-e85f788eec86"

blockWithoutAuthorName =
  id: "0cefd9bc-5f03-480c-81fa-e85f788eec86"
  author: [
    url: "http://twitter.com/thegrid"
    avatar:
      src: "https://pbs.twimg.com/profile_images/519509422008049664/p5MmucQ-_400x400.png"
      width: 48
      height: 48
  ]

blockWithoutAuthorUrl =
  id: "0cefd9bc-5f03-480c-81fa-e85f788eec86"
  author: [
    name: "thegrid"
    avatar:
      src: "https://pbs.twimg.com/profile_images/519509422008049664/p5MmucQ-_400x400.png"
      width: 48
      height: 48
  ]

blockWithoutAuthorAvatar =
  id: "0cefd9bc-5f03-480c-81fa-e85f788eec86"
  author: [
    name: "thegrid"
    url: "http://twitter.com/thegrid"
  ]

blockWithoutAuthorAvatarSrc =
  id: "0cefd9bc-5f03-480c-81fa-e85f788eec86"
  author: [
    name: "thegrid"
    url: "http://twitter.com/thegrid"
    avatar:
      width: 48
      height: 48
  ]

blockWithoutAuthorAvatarWidth =
  id: "0cefd9bc-5f03-480c-81fa-e85f788eec86"
  author: [
    name: "thegrid"
    url: "http://twitter.com/thegrid"
    avatar:
      src: "https://pbs.twimg.com/profile_images/519509422008049664/p5MmucQ-_400x400.png"
      height: 48
  ]

blockWithoutAuthorAvatarHeight =
  id: "0cefd9bc-5f03-480c-81fa-e85f788eec86"
  author: [
    name: "thegrid"
    url: "http://twitter.com/thegrid"
    avatar:
      src: "https://pbs.twimg.com/profile_images/519509422008049664/p5MmucQ-_400x400.png"
      width: 48
  ]


equality "author", validBlock, anotherValidBlock
existence "author", validBlock, blockWithoutAuthor
length "author", validBlock

contains "author[0].name", validBlock
equality "author[0].name", validBlock, anotherValidBlock
existence "author[0].name", validBlock, blockWithoutAuthorName
length "author[0].name", validBlock

contains "author[0].url", validBlock
equality "author[0].url", validBlock, anotherValidBlock
existence "author[0].url", validBlock, blockWithoutAuthorUrl
length "author[0].url", validBlock

equality "author[0].avatar", validBlock, anotherValidBlock
existence "author[0].avatar", validBlock, blockWithoutAuthorAvatar

contains "author[0].avatar.src", validBlock
equality "author[0].avatar.src", validBlock, anotherValidBlock
existence "author[0].avatar.src", validBlock, blockWithoutAuthorAvatarSrc
length "author[0].avatar.src", validBlock

comparison "author[0].avatar.width", validBlock
equality "author[0].avatar.width", validBlock, anotherValidBlock
existence "author[0].avatar.width", validBlock, blockWithoutAuthorAvatarWidth

comparison "author[0].avatar.height", validBlock
equality "author[0].avatar.height", validBlock, anotherValidBlock
existence "author[0].avatar.height", validBlock, blockWithoutAuthorAvatarHeight
