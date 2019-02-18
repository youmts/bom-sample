<template>
  <div id="app">
    <div class="mdl-grid">
      <div class="mdl-cell mdl-cell--4-col">
        <div id="list">
          <ul class="mdl-list">
            <li class="mdl-list__item" v-for="root in roots" :key="root.id">
              <span class="mdl-list__item-primary-content">{{ root.name }}</span>
              <span class="mdl-list__item-secondary-action">
                <button
                  class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect"
                  v-on:click="findTree(root.url)">
                  <i class="material-icons">forward</i>
                </button>
              </span>
            </li>
          </ul>
        </div>
      </div>
      <div class="mdl-cell mdl-cell--8-col">
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
