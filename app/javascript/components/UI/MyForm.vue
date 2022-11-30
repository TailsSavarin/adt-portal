<template>
  <form>
    <slot></slot>
  </form>
</template>

<script>
  export default {
    name: 'MyForm'
  };
</script>
<style scoped>
form {
  margin: 0 auto;
  margin-top: 90px;
  width: 418px;
  min-height: 474px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  padding: 30px;
  background: #F5F6F7;
  border-radius: 20px;
  transition: all 0.5s ease;
  box-shadow: 3px 3px 3px rgba(128, 128, 128, 0.212);
}
form:hover {
  background: rgba(0, 0, 0, 0.041);
  border: 1px solid rgba(0, 0, 0, 0.158);
  transition: all 0.5s ease;
}
</style>