<template>
  <li class="tree-item clearfix clear">
      <div class="tree-item-expander">
          <p v-if="isFolder" v-on:click="toggle">
              [{{ model.open ? 'ー' : '＋' }}]
          </p>
      </div>
      <div class="tree-item-nodestring"
            :style="{width: (600 - depth * 30) + 'px'}">
          <p>
              {{ model.id }}:{{ model.name }}
          </p>
      </div>
      <div class="tree-item-column" style="width: 50px">
          <p style="white-space:nowrap;">
              <input v-model="model.sort_order" style="width: 30px; text-align: right;" />
          </p>
      </div>
      <ul style="padding-left: 30px"
          v-if="isFolder && open"
          >
          <node v-for="(model, index) in model.children"
                :key="index"
                :model="model"
                :depth="depth + 1">
          </node>
      </ul>
      <br />
  </li>
</template>

<script>
export default {
  name: 'node',
  props: {
    model: Object,
    depth: Number,
  },
  data: function() {
    return {
      open: false,
    }
  },
  computed: {
    isFolder: function() {
      return this.model.children &&
        this.model.children.length != 0;
    },
  },
  methods: {
    toggle: function() {
      if (this.isFolder) {
          this.open = !this.open;
      }
    }
  }
}
</script>

<style scoped>
.tree-item {
    list-style: none;
    border-top: 1px solid #444;
    border-left: 1px solid #444;
}

.tree-item-expander {
    margin-left: 5px;
    width: 30px;
    float: left;
    min-height: 1px;
}

.tree-item-nodestring {
    width: 200px;
    float: left;
}

.tree-item-column {
    margin-left: 10px;
    float: left;
}
</style>