<template>
  <div id="app">
    <button class="mdl-button mdl-js-button mdl-button--icon">
      <i class="material-icons">mood</i>
    </button>
    <div class="mdl-grid">
      <div class="mdl-cell mdl-cell--4-col">
        <div id="list">
          <ul class="mdl-list">
            <li class="mdl-list__item root-list-item" v-for="root in roots" :key="root.id">
              <span class="mdl-list__item-primary-content">{{ root.name }}</span>
              <span class="mdl-list__item-secondary-action">
                <button
                  class="mdl-button mdl-js-button mdl-button--icon"
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
.root-list-item {
  border-left: solid 8px gray;
  background: whitesmoke;
  margin-bottom: 5px;
  line-height: 1.5;
  border-radius: 0 15px 15px 0;
  padding: 0.5em;
}

p {
  font-size: 2em;
  text-align: center;
}
</style>
