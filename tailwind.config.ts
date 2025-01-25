import type { Config } from "tailwindcss";

const config: Config = {
  content: ["./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}"],
  theme: {
    extend: {
      maxWidth: {
        "8xl": "1440px",
      },
      colors: {
        black: "#191724",
        "grey-400": "#292929",
      },
    },
  },
  plugins: [],
};

export default config;
