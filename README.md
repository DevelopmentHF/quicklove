# A love2d template build

Starter project files to prototype ideas quicker. 
Don't get bogged with boilerplate.

> [!IMPORTANT]
> This template uses [middleclass](https://github.com/kikito/middleclass?tab=readme-ov-file) for basic OOP structuring.
> It is included in the `game/` directory by default.

## Running the development build

Execute this from top-most directory

```
/Applications/love.app/Contents/MacOS/love game
```

## Building

### Web Building

To build for web in order to publish to itch.io,

```
npm i love.js
```

```
npx love.js game build
```

then zip the build and upload
