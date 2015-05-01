contains = require "./helpers/contains"
equality = require "./helpers/equality"
existence = require "./helpers/existence"
length = require "./helpers/length"


validBlock =
  id: "0cefd9bc-5f03-480c-81fa-e85f788eec86"
  publisher:
    url: "http://twitter.com"
    name: "Twitter"
    favicon: "https://abs.twimg.com/favicons/favicon.ico"
    domain: "twitter.com"

anotherValidBlock =
  id: "7c999208-1a69-47df-8f31-35808673255f"
  publisher:
    url: "http://www.youtube.com/"
    name: "YouTube"
    favicon: "https://s.ytimg.com/yts/img/favicon-vfldLzJxy.ico"
    domain: "www.youtube.com"

blockWithoutPublisher =
  id: "0cefd9bc-5f03-480c-81fa-e85f788eec86"

blockWithoutPublisherUrl =
  id: "0cefd9bc-5f03-480c-81fa-e85f788eec86"
  publisher:
    name: "Twitter"
    favicon: "https://abs.twimg.com/favicons/favicon.ico"
    domain: "twitter.com"

blockWithoutPublisherName =
  id: "0cefd9bc-5f03-480c-81fa-e85f788eec86"
  publisher:
    url: "http://twitter.com"
    favicon: "https://abs.twimg.com/favicons/favicon.ico"
    domain: "twitter.com"

blockWithoutPublisherFavicon =
  id: "0cefd9bc-5f03-480c-81fa-e85f788eec86"
  publisher:
    url: "http://twitter.com"
    name: "Twitter"
    domain: "twitter.com"

blockWithoutPublisherDomain =
  id: "0cefd9bc-5f03-480c-81fa-e85f788eec86"
  publisher:
    url: "http://twitter.com"
    name: "Twitter"
    favicon: "https://abs.twimg.com/favicons/favicon.ico"


equality "publisher", validBlock, anotherValidBlock
existence "publisher", validBlock, blockWithoutPublisher

contains "publisher.url", validBlock
equality "publisher.url", validBlock, anotherValidBlock
existence "publisher.url", validBlock, blockWithoutPublisherUrl
length "publisher.url", validBlock

contains "publisher.name", validBlock
equality "publisher.name", validBlock, anotherValidBlock
existence "publisher.name", validBlock, blockWithoutPublisherName
length "publisher.name", validBlock

contains "publisher.favicon", validBlock
equality "publisher.favicon", validBlock, anotherValidBlock
existence "publisher.favicon", validBlock, blockWithoutPublisherFavicon
length "publisher.favicon", validBlock

contains "publisher.domain", validBlock
equality "publisher.domain", validBlock, anotherValidBlock
existence "publisher.domain", validBlock, blockWithoutPublisherDomain
length "publisher.domain", validBlock
