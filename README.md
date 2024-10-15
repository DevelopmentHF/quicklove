# quicklöve 

Starter project files to prototype ideas quicker. 
Don't get bogged with boilerplate.

Choose from either a **top-down** or a **platformer** preset to get the simple files and structure ready for development.

> [!IMPORTANT]
> This template uses [middleclass](https://github.com/kikito/middleclass?tab=readme-ov-file) for basic OOP structuring.
> It is included in each `game/` directory by default.

---

## Usage

To get started, clone *this* repository, and use the following commands to extract relevant files for you.

```bash
# Clone the repository
git clone git@github.com:DevelopmentHF/quicklove.git

# Navigate into the quicklove folder
cd quicklove

# Generate a platformer project with the name 'SuperPlatformer'
lua quicklove.lua -platformer SuperPlatformer

# Navigate into the generated project
cd ../SuperPlatformer
```

> Or, manually wrangle with the files in Finder or File Explorer. They're all included in this repo anyway :)


## Running the development build

Execute this from top-most directory of your created game folder

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

then zip the build and upload it.
