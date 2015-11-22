React = require('react')
ReactDOM = require('react-dom')
Provider = require('react-redux').Provider
Route = require('react-router').Route
Router = require('react-router').Router
ReduxRouter = require('redux-router').ReduxRouter
store = require('./store/store')
Main = require('./components/Main')
BillingDetails = require('./components/BillingDetails')

container = document.getElementById("main-app")

class Root extends React.Component
  render: ->
    return (
      <Provider store={store}>
        <ReduxRouter>
          <Route path="/" component={Main} />
          <Route path="/details" component={BillingDetails} />
        </ReduxRouter>
      </Provider>
    )


ReactDOM.render(<Root />, container)