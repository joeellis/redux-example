assign = require('lodash').assign
Constants = require('../constants/BillingConstants')

uiReducers = (state, action) ->
  switch action.type
    when Constants.UPDATE_DETAILS_LOADING
      newObject =
        isLoading: true

      return assign({}, state, newObject)
    when Constants.UPDATE_DETAILS_FAILURE
      newObject =
        err: action.err

      return assign({}, state, newObject)
    when Constants.CLEAR_ERRORS
      newObject =
        err: ""

      return assign({}, state, newObject)
    else
      return state

module.exports = uiReducers