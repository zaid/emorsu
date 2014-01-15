# For more information see: http://emberjs.com/guides/routing/

Emorsu.TokensRoute = Ember.Route.extend({
  setupController: (controller, model)->
    controller.set('model', [])
})
