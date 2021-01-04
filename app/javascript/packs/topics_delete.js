jQuery(document).ready(function() {
  let count = $('.fa-trash-o').length
  let search = document.location.search;
  let searchParams = new URLSearchParams(search);
  let page = searchParams.get("page");
  if (count == 0 && page > 1) {
    let protocol = document.location.protocol;
    let host = document.location.host;
    let url = protocol + '//' + host;
    let pagenew = page - 1;
    let urldoc = url + '/topics/' + '?page=' + pagenew;
    window.location.replace(urldoc);
  }
});
