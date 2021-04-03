const path = require('path');
const webpack = require('webpack');
const {CleanWebpackPlugin} = require('clean-webpack-plugin');
const BundleTracker = require('webpack-bundle-tracker');


module.exports = {
   output: {
    path: path.resolve(__dirname, "static/frontend"), // Should be in STATICFILES_DIRS
    publicPath: "/static/", // Should match Django STATIC_URL
    filename: "[name].js", // No filename hashing, Django takes care of this
    chunkFilename: "[id]-[chunkhash].js", // DO have Webpack hash chunk filename, see below
  },
  devServer: {
    writeToDisk: true, // Write files to disk in dev mode, so Django can serve the assets
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader"
        }
      },
      {
        test: /\.css$/,
        use: [
          'style-loader',
          'css-loader'
        ]
      }
    ]
  },
  plugins: [
    new CleanWebpackPlugin(),
    new BundleTracker({filename: './webpack-stats.json'})
  ]
};

