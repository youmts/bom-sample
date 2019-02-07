<template>
  <div id="app">
    <div id="list">
      <ul>
        <li v-for="root in roots" :key="root.id">
          {{ root.name }}
          <a v-on:click="findTree(root.url)">show</a>
        </li>
      </ul>
    </div>
    <div id="tree">
      <ul v-if="tree"
          style="padding-left: 0px">
        <node
          class="tree-root-item"
          :model="tree"
          :depth="0">
        </node>
      </ul>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import node from './components/node.vue'

export default {
  data: function () {
    return {
      roots: [],
      tree: null,
    }
  },
  components: {
    node
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
          this.tree.open = false
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
