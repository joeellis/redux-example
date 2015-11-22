React = require('react')
Link = require('react-router').Link
connect = require('react-redux').connect

saveDetails = require("../actions/BillingActions").saveDetails

Error = require("./Error")

class BillingDetails extends React.Component
  _handleSave: =>
    dispatch = @props.dispatch

    details =
      name: @refs.name.value
      address: @refs.address.value
      creditCard: @refs.creditCard.value

    dispatch(saveDetails(details));

  render: ->
    mainLink = "/"
    details = @props.details
    err = @props.err

    return (
      <div>
        <h1>Details</h1>

        <p>
          Enter credit card number 12345 in order to avoid an error.  Enter any other number to create an error
        </p>

        <Error err={err} />

        <form>
          <input type="text" ref="name" placeholder="Name" defaultValue={details.name} />
          <input type="text" ref="address" placeholder="Address" defaultValue={details.address} />
          <input type="text" ref="creditCard" placeholder="Credit Card #" defaultValue={details.creditCard} />
        </form>
        <div>
          <button type="button" onClick={@_handleSave}>Save</button>
        </div>
        <ul>
          <li>
            <Link to={mainLink}>Main</Link>
          </li>
        </ul>
      </div>
    )

select = (state) ->
  console.log("BillingDetails state:", state);

  return {
    err: state.billing.ui.err
    details: state.billing.details
  }

module.exports = connect(select)(BillingDetails)
