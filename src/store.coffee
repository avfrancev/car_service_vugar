import { ref, reactive, computed, onMounted, toRefs, watch, watchEffect, nextTick } from 'vue'
import { unrefElement, useCssVar, watchOnce, useVModel, useMouseInElement, useStorage, useMagicKeys, useElementBounding, useAsyncState, useColorMode, useCycleList } from '@vueuse/core'

# import { parseISO, addDays, subDays, startOfDay, endOfDay, addMonths, subMonths, startOfMonth, endOfMonth, eachDayOfInterval } from 'date-fns'
import daisyThemes from 'daisyui/src/colors/themes'



themes = ['light','dark','coffee','forest','emerald','autumn', 'business', 'bumblebee']

currTheme = useColorMode
  attribute: 'data-theme'
  modes: [
    themes...
    dark: 'dracula'
  ]
currTheme.value = 'dark'
{ next: nextTheme } = useCycleList([themes...], initialValue: currTheme)

# console.log daisyThemes
# watchEffect ->
#   console.log currTheme.value
#   console.log daisyThemes["[data-theme=#{currTheme.value}]"]
#   console.log daisyThemes["[data-theme=dark]"]

currThemeColors = computed ->
  daisyThemes["[data-theme=#{currTheme.value}]"] or daisyThemes["[data-theme=dark]"]


export {
  currTheme
  nextTheme
  currThemeColors
}
