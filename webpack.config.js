const path = require('path');
const webpack = require('webpack');
const ESLintPlugin = require('eslint-webpack-plugin');

module.exports = {
    mode: 'development',
    entry: {
        rails_application_includes: './app/javascript/application.js',
        // oh my god tsx is awful
        // just stick with jsx
        file: './app/javascript/file/file.jsx',
    },
    resolve: {
        fallback: {
            crypto: require.resolve("crypto-browserify"),
        },
    },
    stats: {
        errorDetails: true,
    },
    output: {
        filename: '[name].bundle.js',
        chunkFilename: '[name].bundle.js',
        assetModuleFilename: '[name].bundle.[ext]',
        path: path.resolve(__dirname, 'app/javascript/dist/'),
    },
    devtool: 'inline-source-map',
    module: {
        rules: [
            {
                test: /\.(js|jsx|ts|tsx)$/,
                exclude: /node_modules/,
                use: [
                    {
                        loader: 'babel-loader',
                        options: {
                            presets: ['@babel/preset-env', '@babel/preset-react'],
                        },
                    },
                    'ts-loader',
                ],
            },
        ],
    },
    optimization: {
        emitOnErrors: false,
    },
    plugins: [
        new ESLintPlugin({
        fix: true,
        }),
    ]
};
