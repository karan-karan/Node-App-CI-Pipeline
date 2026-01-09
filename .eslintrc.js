module.exports = {
    env: {
        browser: true,
        es2021: true,
        node: true,
    },
    extends: 'eslint:recommended',
    parserOptions: {
        ecmaVersion: 12,
    },
    rules: {
        'no-console': 'off',
        'indent': ['error', 4],
        'quotes': ['error', 'single'],
        'semi': ['error', 'always'],
    },
    overrides: [
        {
            files: ['tests/**/*.js'],
            env: {
                jest: true,
            },
        },
    ],
};