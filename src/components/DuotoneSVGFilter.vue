<template>
<!-- <pre>{{fecolormatrix}}</pre> -->
<svg class="hidden">
  <filter :id="props.filterId">
    <!-- <fecolormatrix id="fe" type="matrix" values="0.375 0 0 0 0.3515625 0.83203125 0 0 0 0.1640625 0.40234375 0 0 0 0.5234375 0 0 0 1 0"> -->
    <feColorMatrix id="fe" type="matrix" :values="fecolormatrix"></feColorMatrix>
  </filter>
</svg> 
</template>

<script lang="coffee">
  import { ref, reactive, computed, onMounted, toRefs, watch, watchEffect, nextTick } from 'vue'
  # import { unrefElement, useCssVar, watchOnce, useVModel, useMouseInElement, useStorage, useMagicKeys, useElementBounding, useAsyncState, useColorMode, useCycleList } from '@vueuse/core'
  import { colord, extend } from "colord"
  import namesPlugin from "colord/plugins/names"

  extend([namesPlugin])

  duotone = (col1, col2) ->
    color1 = colord(col1).rgba
    color2 = colord(col2).rgba
    # console.log color1
    # return
    c1 =
      red: color1.r / 256
      green: color1.g / 256
      blue: color1.b / 256
    c2 =
      red: color2.r / 256
      green: color2.g / 256
      blue: color2.b / 256
    value = []
    value = value.concat([c1.red - c2.red, 0, 0, 0, c2.red])
    value = value.concat([c1.green - c2.green, 0, 0, 0, c2.green])
    value = value.concat([c1.blue - c2.blue, 0, 0, 0, c2.blue])
    value = value.concat([0, 0, 0, 1, 0])
    return value.join ' '


  export default {
    props:
      colors: Array
      filterId:
        type: String
        default: 'duotone'
    setup: ( props ) ->
      fecolormatrix = computed ->
        duotone props.colors[0], props.colors[1]
      # console.log duotone('red','blue')
      return {
        props
        fecolormatrix
      }
  }
</script>