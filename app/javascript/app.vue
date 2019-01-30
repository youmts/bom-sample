<template>
  <div id="app">
    <button v-on:click="findRoots">find</button>
    <ul>
      <li v-for="root in roots" :key="root.id">
        {{ root.name }}
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data: function () {
    return {
      roots: []
    }
  },
  methods: {
    findRoots() {
      axios.get('nodes.json')
        .then(res => {
          console.log(res.data)
          this.roots = res.data
        })
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
