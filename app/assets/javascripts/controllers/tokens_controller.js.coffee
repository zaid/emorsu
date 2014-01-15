# for more details see: http://emberjs.com/guides/controllers/

Emorsu.TokensController = Ember.ArrayController.extend({
  actions:
    createToken: (content) ->
      newToken = @store.createRecord('token', { content: content, result: 'data from server goes here' })

      @pushObject(token: newToken)
      @set('tokenContent', '')
})
