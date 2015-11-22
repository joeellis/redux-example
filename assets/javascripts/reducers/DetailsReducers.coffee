assign = require('lodash').assign
Constants = require('../constants/BillingConstants')

detailsReducers = (state, action) ->
  switch action.type
    when Constants.UPDATE_DETAILS_SUCCESS
      details = action.details

      newObject =
        name: details.name
        address: details.address
        creditCard: details.creditCard

      return assign({}, state, newObject)
    else
      # Super important that we return the default state if nothing matches
      # That way other action types can easily pass through this switch
      # statement
      return state

module.exports = detailsReducers