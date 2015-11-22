BillingConstants = require('../constants/BillingConstants')

## Paylods

clearErrors = ->
  return {
    type: BillingConstants.CLEAR_ERRORS
  }

updatingDetailsLoading = ->
  return {
    type: BillingConstants.UPDATE_DETAILS_LOADING
  }

updateDetailsFailed = (err) ->
  return {
    type: BillingConstants.UPDATE_DETAILS_FAILURE
    err: err
  }

updatedDetailsSuccess = (details) ->
  return {
    type: BillingConstants.UPDATE_DETAILS_SUCCESS
    details: details
  }

## Actions

saveDetails = (details, options = {}) ->
  return (dispatch, getState) =>
    dispatch(clearErrors())

    dispatch(updatingDetailsLoading())

    if details.creditCard != "12345"
      err = "wrong credit card number!"

    if err
      dispatch(updateDetailsFailed(err))
    else
      dispatch(updatedDetailsSuccess(details))


module.exports = {
  saveDetails: saveDetails
}