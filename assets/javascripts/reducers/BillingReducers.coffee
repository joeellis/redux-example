uiReducers = require('../reducers/UIReducers')
detailsReducers = require('../reducers/DetailsReducers')

initialState =
  ui:
    isLoading: false
    err: ""
  details:
    name: ""
    address: ""
    creditCard: ""

BillingReducers = (state, action) ->
  state = initialState unless state?

  return {
    ui: uiReducers(state.ui, action)
    details: detailsReducers(state.details, action)
  }

module.exports = BillingReducers