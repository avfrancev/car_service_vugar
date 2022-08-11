let colors = require('tailwindcss/colors')
_colors = [ 'gray', 'red', 'orange', 'amber', 'lime',  'green', 'emerald', 'teal', 'cyan', 'sky', 'indigo',  'violet', 'fuchsia', 'pink', 'rose']

x = _colors.reduce((acc,c) => {
  // acc[c] = {}
  let cc = [] 
  for (var i = 0; i < 10; i++) {
    cc.push(`from-${c}-${i*100}`)
  }
  acc.push(...cc)
  return acc
}, [])
      //   acc[c] = {
      //     gr: "from-#{c}-200"
      //   }
      //   return acc
      // , {}

// console.dir(colors)
// console.dir({x})

module.exports = {
  content: [
    "./index.html",
    "./src/**/*.{vue,js,ts,jsx,tsx,coffee}",
  ],
  safelist: [
    // ...x
  //   // pattern: /from-(\S*0)/g
  ],
  theme: {
    extend: {},
  },
  plugins: [
    require('daisyui'),
  ],
  darkMode: "class",
  daisyui: {
    styled: true,
    base: true,
    utils: true,
    logs: false,
    rtl: false,    
  }
}