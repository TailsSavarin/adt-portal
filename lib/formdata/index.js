export function objectToFormData(obj, rootName, ignoreList) {
  const formData = new FormData();

  const ignore = root => Array.isArray(ignoreList) && ignoreList.some(x => x === root);

  // eslint-disable-next-line complexity
  function appendFormData(data, root) {
    if (!ignore(root)) {
      root = root || '';
      const prop = Object.prototype.hasOwnProperty;
      if (data instanceof File) {
        formData.append(root, data);
      } else if (Array.isArray(data)) {
        for (let i = 0; i < data.length; i++) {
          appendFormData(data[i], root + '[]');
        }
      } else if (data && typeof data === 'object') {
        for (const key in data) {
          if (prop.call(data, key)) {
            if (root === '') {
              appendFormData(data[key], key);
            } else {
              appendFormData(data[key], root + '[' + key + ']');
            }
          }
        }
      } else
      if (data !== null && typeof data !== 'undefined') {
        formData.append(root, data);
      }
    }
  }

  appendFormData(obj, rootName);

  return formData;
}
