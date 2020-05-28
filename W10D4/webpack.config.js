const path = require('path');

module.exports = {
  entry: "./entry.jsx",
  output: {
    path: path.resolve(__dirname, "dist"), //dist is folder it is creating.  blank is this one.
    filename: "./bundle.js",
  },
  module: {
    rules: [
      {
        test: /\.jsx?$/,
        exclude: /(node_modules)/,
        use: {
          loader: 'babel-loader',
          query: {
            presets: ['@babel/env', '@babel/react']
          }
        }
      }
    ]
  },
  devtool: "source-map",
  resolve: {
    extensions: ['.js', '.jsx', '*']
  }
};