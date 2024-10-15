# quicklöve 

Starter project files to prototype ideas quicker. 
Don't get bogged with boilerplate.

Choose from either a **top-down** or a **platformer** preset to get the simple files and structure ready for development.

> [!IMPORTANT]
> This template uses [middleclass](https://github.com/kikito/middleclass?tab=readme-ov-file) for basic OOP structuring.
> It is included in each `game/` directory by default.

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
