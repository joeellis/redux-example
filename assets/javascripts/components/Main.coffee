React = require('react')
Link = require('react-router').Link
connect = require('react-redux').connect

class Main extends React.Component
  render: ->
    detailsLink = "/details"

    return (
      <div>
        <h1>Main</h1>

        <ul>
          <li>
            <Link to={detailsLink}>Billing Details</Link>
          </li>
        </ul>
      </div>
    )

module.exports = Main