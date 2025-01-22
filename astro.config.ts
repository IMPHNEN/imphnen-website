import { defineConfig, envField } from "astro/config";
import tailwind from "@astrojs/tailwind";
import partytown from "@astrojs/partytown";
import sitemap from "@astrojs/sitemap";

export default defineConfig({
  server: {
    port: process.env.PORT || 3000,
  },
  env: {
    schema: {
      PUBLIC_API_URL: envField.string({
        context: "client",
        access: "public",
        optional: true,
        default: "https://api.imphnen.dev/api/v1",
      }),
      PUBLIC_PORT: envField.number({
        context: "client",
        access: "public",
        optional: false,
        default: 3000,
      }),
      PUBLIC_BASE_URL: envField.string({
        context: "client",
        access: "public",
        optional: true,
        default: "https://imphnen.dev",
      }),
    },
  },
  site: "https://imphnen.dev",
  integrations: [
    tailwind(),
    sitemap({
      changefreq: "weekly",
      priority: 0.7,
      entryLimit: 10000,
    }),
    partytown({
      config: {
        forward: ["dataLayer.push"],
      },
    }),
  ],
});
