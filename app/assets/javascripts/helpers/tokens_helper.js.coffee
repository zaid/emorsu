Ember.Handlebars.helper('formatResult', (value, options) ->

  if value
    formatted = Handlebars.Utils.escapeExpression(value)

    unless value.match(/\w/)
      formatted = value.replace(/\s/g, '&nbsp;')

    new Handlebars.SafeString(formatted)
)
