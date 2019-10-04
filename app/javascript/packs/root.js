import $ from 'jquery';
require('jquery-datetimepicker');

$(function() {
  console.log($('#rate_fixed_till').val());
  $('#rate_fixed_till').datetimepicker();
});