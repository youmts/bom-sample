<template>
  <div id="app">
    <ul>
      <li v-for="root in roots" :key="root.id" v-on:click="findTree(root.url)">
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
      roots: [],
      tree: null,
    }
  },
  methods: {
    findRoots() {
      axios.get('nodes.json')
        .then(res => {
          console.log(res.data)
          this.roots = res.data
        })
    },
    findTree(url) {
      axios.get(url)
        .then(res => {
          console.log(res.data)
          this.tree = res.data
        })
    },
  },
  created: function() {
    this.findRoots()
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
