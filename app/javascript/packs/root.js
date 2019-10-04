import jQuery from 'jquery';
require('jquery-datetimepicker');

$(function() {
  console.log($('#rate_fixed_till').val());
  jQuery('#rate_fixed_till').datetimepicker();
});