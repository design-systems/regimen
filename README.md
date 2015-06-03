# Regimen [![Build Status](https://travis-ci.org/the-grid/regimen.svg)](https://travis-ci.org/the-grid/regimen)

Define what can be consumed.

A [Chai](http://chaijs.com/) plugin for design systems at The Grid.


## Usage

```coffeescript
chai = require "chai"
regimen = require "regimen"
chai.use regimen
```

### Blocks

#### Properties

The following assertions are equivalent, however the latter provides a better error message:

```coffeescript
expect(block.cover).to.exist
# AssertionError: expected undefined to exist
```

```coffeescript
expect(block).with.a "cover"
# AssertionError: expected block 123 to have a cover
```
Again, assertions could be written as follows:

```coffeescript
expect(block.cover.orientation).to.equal "portrait"
# AssertionError: expected 'landscape' to equal 'portrait'
```

```coffeescript
expect(block).to.have.a("cover.orientation").equal "portrait"
# AssertionError: expected block 123 to have a cover.orientation equal to 'portrait' but got 'landscape'
```

```coffeescript
expect(block).to.have.a("cover").oriented "portrait"
# AssertionError: expected block 123 to have a cover with 'portrait' orientation but got 'landscape'
```
However, if the `cover` were missing the latter provides the most accurate error message:

```coffeescript
expect(block.cover.orientation).to.equal "portrait"
# TypeError: Cannot read property 'orientation' of undefined
```

```coffeescript
expect(block).to.have.a("cover.orientation").equal "portrait"
# AssertionError: expected block 123 to have a cover.orientation
```

```coffeescript
expect(block).to.have.a("cover").oriented "portrait"
# AssertionError: expected block 123 to have a cover
```

The second option should only serve as interim support for future additions in the block structure until custom properties and methods can be added.


##### Optionals

To specify requirements about optional content, use `maybe`:

```coffeescript
expect(block).to.maybe.have.a("title").with.length.lte 20
```

#### Types and Subtypes

```coffeescript
  expect(block1).to.be.ofType "video"
  expect(block2).to.not.be.ofType "video"
```

```coffeescript
  expect(block1).to.be.subtypeOf "media"
  expect(block2).to.not.be.subtypeOf "media"
```

### Items

#### Reposts

```coffeescript
  expect(item1).to.be.a.repost
  expect(item2).to.not.be.a.repost
```

## Development

```sh
npm install
npm test
```
