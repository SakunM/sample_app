document.addEventListener('turbo:load',() => {
  document.addEventListener('change', e => {
    let upload = document.querySelector('#micropost_image');
    if (upload === null || upload.files.length === 0){ return;}
    let bytes = upload.files[0].size/1024/1024;
    if (bytes > 5){
      alert('Maximum file size is 5MB. please chooose a smoller file.');
      upload.value = '';
    }
  });
});