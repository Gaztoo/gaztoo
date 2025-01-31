const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      colors: {
        black: '#1A202C',
        white: '#FFFFFF',
        // blue
        blue: '#47B6D4',
        light_blue: '#DAF0F6',
        // gray
        gray: '#B3B3B3',
        light_gray: '#F0EFEF',
        lightest_gray: '#F7FAFC',
        // purple
        purple: '#4E61B6',
        light_purple: '#DCDFF0',
        dark_purple: '#2F2762',
        // red
        red: '#EE1E5F',
        light_red: '#FCD2DF',
        // yellow
        yellow: '#EBA90D',
        light_yellow: '#FEF0D0',
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      spacing: {
        '21': '5.25rem', // 84px
        '30': '7.5rem', // 120px
      },
    },
  },
  plugins: []
}
