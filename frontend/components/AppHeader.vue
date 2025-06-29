<template>
  <header class="bg-[#ed1c2c] shadow-md sticky top-0 z-50">
    <nav class="container mx-auto flex flex-wrap justify-between items-center px-4 py-4">
      <!-- Logo -->
      <NuxtLink to="/" class="flex items-center space-x-3">
        <span class="text-white text-2xl font-extrabold">Sportclub Reeuwijk</span>
      </NuxtLink>

      <!-- Hamburger icon -->
      <button
        class="md:hidden text-white"
        @click="menuOpen = !menuOpen"
        aria-label="Toggle menu"
      >
        <svg v-if="!menuOpen" class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
            d="M4 6h16M4 12h16M4 18h16" />
        </svg>
        <svg v-else class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
            d="M6 18L18 6M6 6l12 12" />
        </svg>
      </button>

      <!-- Navigation -->
      <ul
        class="font-medium text-sm transition-all duration-300 ease-in-out md:flex gap-4 md:static absolute top-full left-0 w-full md:w-auto bg-[#ed1c2c] md:bg-transparent px-4 py-4 md:py-0"
        :class="menuOpen ? 'block' : 'hidden md:flex'"
      >
        <li
          v-for="item in menuItems"
          :key="item.name"
          class="relative group"
        >
          <template v-if="item.children">
            <!-- Parent with dropdown -->
            <button
              class="flex items-center w-full md:w-auto text-white py-2 md:py-0 hover:font-bold"
              @click="menuOpen ? toggleSubmenu(item.name) : null"
            >
              {{ item.name }}
              <svg class="ml-1 w-4 h-4" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M5.23 7.21a.75.75 0 011.06-.02L10 10.672l3.71-3.48a.75.75 0 011.02 1.1l-4.25 4a.75.75 0 01-1.04 0l-4.25-4a.75.75 0 01-.02-1.06z" clip-rule="evenodd" />
              </svg>
            </button>

            <!-- Submenu -->
            <ul
              class="pl-4 md:absolute md:left-0 md:top-full md:bg-[#ed1c2c] md:shadow-lg md:min-w-[160px] md:rounded-md transition-all duration-200 ease-in-out"
              :class="[
                menuOpen && submenuOpen === item.name ? 'block bg-[#c41221]' : 'hidden',
                'md:bg-[#ed1c2c] md:block md:opacity-0 md:invisible md:group-hover:opacity-100 md:group-hover:visible'
              ]"
            >
              <li v-for="child in item.children" :key="child.name">
                <NuxtLink
                  :to="child.to"
                  class="block py-2 px-2 text-white hover:bg-[#c41221] hover:font-bold"
                  @click="closeMenus"
                >
                  {{ child.name }}
                </NuxtLink>
              </li>
            </ul>
          </template>

          <template v-else>
            <NuxtLink
              :to="item.to"
              class="block py-2 md:py-0 text-white hover:font-bold"
              @click="closeMenus"
            >
              {{ item.name }}
            </NuxtLink>
          </template>
        </li>
      </ul>
    </nav>
  </header>
</template>

<script setup>
import { ref } from 'vue'

const menuOpen = ref(false)
const submenuOpen = ref(null)

function toggleSubmenu(name) {
  submenuOpen.value = submenuOpen.value === name ? null : name
}

function closeMenus() {
  menuOpen.value = false
  submenuOpen.value = null
}

const menuItems = [
  { name: 'Home', to: '/' },
  { name: 'Sportclub Reeuwijk', to: '/sportclub' },
  {
    name: 'Trainingen',
    children: [
      { name: 'Overzicht', to: '/training' },
      { name: 'Trainers', to: '/training/trainers' },
      { name: 'Data', to: '/training/dates' },
      { name: 'Pupillen', to: '/training/pupils' },
      { name: 'Junioren', to: '/training/juniors' },
      { name: 'Senioren', to: '/training/seniors' }
    ]
  },
  { name: 'Wedstrijden', to: '/wedstrijden' },
  { name: 'Uitslagen', to: '/uitslagen' },
  { name: 'Foto’s', to: '/fotos' },
  { name: 'Veilig Sporten', to: '/veilig-sporten' },
  { name: 'Lid Worden?', to: '/lid-worden' }
]
</script>
