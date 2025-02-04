import eslintPluginAstro from "eslint-plugin-astro";
export default [
  ...eslintPluginAstro.configs.recommended,
  {
    ignores: [
      "**/dist",
      "**/dist/~partytown",
      "**/node_modules",
      "**/public",
      "**/.astro",
    ],
    rules: {
      "no-unused-vars": "error",
      "no-undef": "error",
      "no-console": "error",
      "astro/no-set-html-directive": "error",
      "astro/no-set-text-directive": "error",
      "astro/jsx-a11y-anchor-is-valid": "off",
    },
  },
];
