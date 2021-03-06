{
  "name": "curriculum",
  "private": true,
  "dependencies": {
    "@rails/webpacker": "^3.0.2",
    "bootstrap": "^4.0.0-beta.2",
    "coffeescript": "1.12.7",
    "elm": "^0.18.0",
    "elm-format": "^0.6.1-alpha",
    "elm-webpack-loader": "^4.4.0",
    "font-awesome": "^4.7.0"
  },
  "devDependencies": {
    "elm-hot-loader": "^0.5.4",
    "webpack-dev-server": "^2.9.5"
  },
  "scripts": {
    "postinstall": "npm rebuild node-sass && npm rebuild elm"
  }
}
