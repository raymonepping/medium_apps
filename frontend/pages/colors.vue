<template>
  <div class="p-6">
    <h1 class="text-2xl font-bold mb-4">Color Search</h1>
    <input
      v-model="query"
      @input="fetchColors"
      type="text"
      placeholder="Type a color name..."
      class="border p-2 rounded w-full mb-4"
    />
    <div v-if="colors.length">
      <ul>
        <li v-for="color in colors" :key="color.hex">
          <span class="font-semibold">{{ color.name }}</span> — 
          <span :style="{ color: color.hex }">{{ color.hex }}</span>
        </li>
      </ul>
    </div>
    <div v-else class="text-gray-500">No results</div>
  </div>
</template>

<script setup>
import { ref } from 'vue'

const query = ref('')
const colors = ref([])

const fetchColors = async () => {
  if (!query.value) {
    colors.value = []
    return
  }

  try {
    const { data } = await useFetch(`/api/colors?q=${query.value}`)
    colors.value = data.value || []
  } catch (err) {
    console.error('Failed to fetch colors', err)
    colors.value = []
  }
}
</script>
