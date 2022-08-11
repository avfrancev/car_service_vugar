import { ref, reactive, computed, onMounted, toRefs, watch, watchEffect, nextTick } from 'vue'
import { unrefElement, useCssVar, watchOnce, useVModel, useMouseInElement, useStorage, useMagicKeys, useElementBounding, useAsyncState, createEventHook } from '@vueuse/core'

# import useMainState from '@/store/useMainState.coffee'
import { createClient } from '@supabase/supabase-js'
import { addDays, startOfDay, endOfDay, addMonths, startOfMonth, endOfMonth } from 'date-fns'

export supabase = createClient('https://kupgjwgefkdmaoyagcan.supabase.co', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt1cGdqd2dlZmtkbWFveWFnY2FuIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTU3NDU1NzUsImV4cCI6MTk3MTMyMTU3NX0.ZEkGqsrPWwvL4aVPftmQ3sq2AqsAlG-Kq2stnuAewJY')



getSensorsInRangePromise = (start, end, interval = '10 minutes') -> new Promise (res, rej) ->
  if !(start instanceof Date) || !(end instanceof Date)
    throw new Error 'Arguments not an instance of Date!'
    return
  console.debug 'exec getSensorsInRange...', start.toISOString(), end.toISOString(), interval
  { data, error } = await supabase
    .rpc('select_range', {
      start_date: start.toISOString()
      end_date: end.toISOString()
      bucket_interval: interval
    })
  if error
    console.error {error}
    rej(error.message || error)
  # console.log 'DATA:',data
  res data
  return

export getSensorsInRange = (args...) ->
  useAsyncState( (_args...) ->
    if !_args.length
      _args = args
    return getSensorsInRangePromise(_args...)
  , [], { immediate: false } )


# export select_range = useAsyncState(getSensorsInRangePromise, [], {immediate: false})
# /////////////////////////////

getSensorsLastPromise = ->
  new Promise (res, rej) ->
    {data, error} = await supabase
      .from('Sensors_last')
      # .select().eq("id",v || la.value)
      .select().single()
    if error
      rej(error.message || error)
    res data

export getSensorsLast = -> useAsyncState(getSensorsLastPromise, [], {immediate: true})
getSensorsLastHook = createEventHook()
export onSensorsLastUpdate = getSensorsLastHook.on
# watchEffect ->
#   console.debug 'XXXXXXX', sensorsLast.state.value
# /////////////////////////////


export current_readings = useAsyncState(
  (v) -> new Promise (res, rej) ->
    {data, error} = await supabase
      .from('Sensors_last')
      # .select().eq("id",v || la.value)
      .select().single()
    if error
      rej(error.message || error)
    res data
  ,{},{
    immediate: true
  })



supabase
  .from('Sensors_last')
  .on('UPDATE', getSensorsLastHook.trigger )
  # .on('UPDATE', (payload) ->
  #   getSensorsLastHook.trigger payload
  # )
  .subscribe()

