// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$ ->
  $('#product_search').typeahead
    name: "product"
    remote: "/products/autocomplete?query=%QUERY"