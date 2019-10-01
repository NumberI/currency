const { environment } = require('@rails/webpacker')

module.exports = environment

const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    // $: 'jquery/src/jquery',
    // jquery: 'jquery/src/jquery',
    // jQuery: 'jquery/src/jquery'
    $: 'jquery-datetimepicker/jquery',
    jquery: 'jquery-datetimepicker/jquery',
    jQuery: 'jquery-datetimepicker/jquery',
    jQuery.datetimepicker: 'jquery-datetimepicker/jquery-datetimepicker'

  })
)