React = require('react')
connect = require('react-redux').connect

class Error extends React.Component
  render: ->
    err = @props.err

    if err
      return (
        <div>
          error: {err} nothing saved!
        </div>
      )
    else
      return (
        <div>no errors yet!</div>
      )

module.exports = Error