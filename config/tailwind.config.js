const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: ["./public/*.html", "./app/helpers/**/*.rb", "./app/javascript/**/*.js", "./app/views/**/*.{erb,haml,html,slim}"],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans]
      },
      typography: {
        DEFAULT: {
          css: {
            maxWidth: "75ch" // 65ch was a bit too narrow
          }
        }
      }
    }
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/container-queries")
  ]
};
