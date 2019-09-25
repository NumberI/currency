$.ajax({
    url: '/',
    dataType: 'json',
    success: function(data) {
      console.log(data);
    },
    error: function() {
      alert('error');
    }
  });
