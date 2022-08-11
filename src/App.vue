<template lang="pug">
//- .container.mx-auto.py-2
  pre currTheme: {{currThemeColors}}
  button.btn.btn-activew(@click="nextTheme()") next theme
  //- Image(:src="`/mechanic.jpeg?preset=thumbnail`")
//- .flex.space-x-2
//-   .h-12.w-12.border(
//-     v-for="c in currThemeColors"
//-     :style="{background: c}"
//-     )
.sticky
  button.btn.btn-activew(@click="nextTheme()") next theme [ {{currTheme}} ]

DuotoneSVGFilter(:colors="[currThemeColors.primary,currThemeColors.accent]")
DuotoneSVGFilter(:colors="[currThemeColors.accent,currThemeColors.primary]", :filter-id="'duotone2'")
.h-screen.relative.overflow-y-scrollw
  //- .sticky
  .absolute.inset-0.select-none
    Image.absolute.object-cover.opacity-100.w-full.h-full(:src="ImageMechanic" style="filter: url(#duotone)")
    //- Image.absolute.object-cover.inset-0.w-full.h-full.opacity-30(:src="ImageMechanic" style="filter: url(#duotone2)")
    .absolute.inset-0.bg-gradient-to-t.from-accent
  //- .absolute.bg-blue-400.inset-0
    div asdasdasdasd
    pre asdas
  //- .absolute.inset-0
  .inset-0.absolute.overflow-y-auto
    .flex.ml-164.m-12.items-center
      svg(viewBox="0,0,300,300").w-24.overflow-visible.transform.rotate-30
        //- path.fill-red-300.stroke-red-600(d="M0,25 L25,0 L50,0 L75,25")
        polygon(
          points="300,150 225,280 75,280 0,150 75,20 225,20"
          class="stroke-primary/70 fill-accent/00 stroke-5"
          vector-effect="non-scaling-stroke"
          )
        //- // transform="trnaslate(10,10) rotate(30)"
        polygon(
          vector-effect="non-scaling-stroke"
          points="300,150 225,280 75,280 0,150 75,20 225,20"
          class="stroke-primary/100 fill-accent/50 stroke-2 transform origin-center rotate-0 scale-80 translate-x-0 -translate-y-0 "
          )
      pre.-ml-12.text-white.text-5xl.z-1 Asdsadasds
    .text-white
      .flex.flex-col.items-center.justify-center.w-full.h-full
        div(v-for="x in 130") asdas {{x}}
    //- .flex.justify-center.items-center.h-full
    //- .flex.h-full
      //- .flex.items-center.w-full.h-full
    //- .block.h-full.pre.text-4xl.text-primary-content asdasdasd
//- router-view
</template>

<!-- <template>
  <pre class="text-red-300 p-12">asdasd</pre>
</template>
 -->
<script lang="coffee">
  import { ref, reactive, computed, onMounted, toRefs, watch, watchEffect, nextTick } from 'vue'
  import { unrefElement, useCssVar, watchOnce, useVModel, useMouseInElement, useStorage, useMagicKeys, useElementBounding, useAsyncState, useColorMode, useCycleList } from '@vueuse/core'

  import ImageMechanic from '@images/mechanic2.jpeg?preset=hd'

  # import asdsad from 'daisyui/src/colors/themes'
  # console.log asdsad
  # console.log asdsad.accent(opacityValue:0.1)

  import { currTheme, nextTheme, currThemeColors } from '@/store.coffee'


  export default {
    setup: ->
      return {
        currTheme, nextTheme, currThemeColors
        ImageMechanic
      }
  }
</script>

<style lang="sass">
@tailwind base
@tailwind components
@tailwind utilities

html,body,#app
  min-height: 100%

@layer components
  .text-muted
    @apply text-base-content/40

</style>
