<script setup>
import { ref } from "vue";
import axios from "axios";
const list = ref([]);
const getList = async () => {
  try {
    const response = await axios.get("http://127.0.0.1:8888/list");
    console.log(response.data);
    return response.data;
  } catch (error) {
    console.error(error);
  }
};
getList().then((data) => {
  list.value = data;
});
</script>
<template>
  <template v-for="item in list" :key="item.id">
    <h2>{{ item }}</h2></template
  >
</template>
