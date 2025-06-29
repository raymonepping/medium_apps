<template>
  <footer class="fixed bottom-0 left-0 w-full bg-[#222f81] text-white border-t border-white/20 z-50">
    <div class="container mx-auto px-4 py-3 flex flex-col md:flex-row justify-between items-center text-sm">
      <span>
        © 2025 Sportclub Reeuwijk —
        <span class="hoverable">Samen</span> |
        <span class="hoverable">Sportief</span> |
        <span class="hoverable">Sterk</span>
      </span>
      <div class="flex gap-4 mt-2 md:mt-0">
        <NuxtLink to="/contact" class="hover:text-[#cb2744] hover:scale-110 transition-transform duration-300">Contact</NuxtLink>
        <NuxtLink to="/privacy" class="hover:text-[#cb2744] hover:scale-110 transition-transform duration-300">Privacy</NuxtLink>
        <a href="https://instagram.com" target="_blank" class="hover:text-[#cb2744] hover:scale-110 transition-transform duration-300">
          <i class="fab fa-instagram"></i>
        </a>
        <a href="https://facebook.com" target="_blank" class="hover:text-[#cb2744] hover:scale-110 transition-transform duration-300">
          <i class="fab fa-facebook-f"></i>
        </a>
      </div>
    </div>
  </footer>
</template>

<script setup>
// no logic required for this component
</script>

<style scoped>
.hoverable {
  display: inline-block;
  transition: transform 0.15s ease-in-out, color 0.15s ease-in-out;
  cursor: pointer;
}
.hoverable:hover {
  transform: scale(1.05);
  color: #cbcaca;
}
</style>
