<template>
    <button class="btn">
      <slot></slot>
    </button>
  </template>
  
  <script>
  export default {
    name: 'my-button'
  }
  </script>
  
  <style >
  .btn {
    min-width: 98px;
    min-height: 44px;
    background: #BFD1DF;;
    border: none;
    border-radius: 10px;
    color: white;
    font: 700 16px / 30px 'Montserrat';
    padding: 10px;
    cursor: pointer;
  }
  </style>