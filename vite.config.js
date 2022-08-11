const util = require('util')
const path = require('path')
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import coffee from 'rollup-plugin-coffee-script'
import Pages from 'vite-plugin-pages'
import Icons from 'unplugin-icons/vite'
import IconsResolver from 'unplugin-icons/resolver'
import Components from 'unplugin-vue-components/vite'
import WindiCSS from 'vite-plugin-windicss'
import imagePresets, { widthPreset, hdPreset } from 'vite-plugin-image-presets'

// import WindiCSS from 'vite-plugin-windicss'
// import Inspect from 'vite-plugin-inspect'
// import analyze from 'rollup-plugin-analyzer'

// import { viteCommonjs } from '@originjs/vite-plugin-commonjs'

// import coffee from 'rollup-plugin-coffee-script'
// const coffeescript = Object.assign( coffee(), {
//   // async handleHotUpdate(ctx) {
//   //   const coffeeModule = ctx.modules.find((m) => {
//   //     return /.coffee/.test(m.id)
//   //   })
//   //   if (coffeeModule)
//   //     return [coffeeModule,...ctx.modules]
//   //   return
//   // }
// })

export default defineConfig({
  resolve: {
    dedupe: ['three'],
    alias: {
      '@images': path.resolve(__dirname, './public'),
      '@' : path.resolve(__dirname, './src'),
      // three: path.resolve(__dirname, "./node_modules/three/"),
      // 'three-text2d': path.resolve(__dirname, "./node_modules/three-text2d/"),
    }
  },  
  // optimizeDeps: {
    // exclude: ['three-text2d']
  // },
  plugins: [
    Pages({
      extensions: ['vue']
    }),
    imagePresets({
      hd: hdPreset({
        class: 'img hd',
        widths: [440, 700],
        sizes: '(min-width: 700px) 700px, 100vw',
        formats: {
          avif: { quality: 44 },
          webp: { quality: 44 },
          jpg: { quality: 50 },
        },
      }),
      thumbnail: widthPreset({
        class: 'img thumb',
        loading: 'lazy',
        widths: [48, 96],
        formats: {
          webp: { quality: 50 },
          jpg: { quality: 70 },
        },
      }),
    }),
    coffee(),
    vue(),
    WindiCSS(),
    Components({
      // allow auto load markdown components under `./src/components/`
      extensions: ['vue'],

      // allow auto import and register components used in markdown
      include: [/\.vue$/, /\.vue\?vue/],

      directoryAsNamespace: true,
      // custom resolvers
      resolvers: [
        // auto import icons
        // https://github.com/antfu/unplugin-icons
        IconsResolver({
          prefix: 'i',
          // customCollections: ['fluent:temperature-24-filled']
          // enabledCollections: ['fluent']
        }),
      ],
    }),

    // // https://github.com/antfu/unplugin-icons
    Icons({
      autoInstall: true,
    }),    
  ],   
})
