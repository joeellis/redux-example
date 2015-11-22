createStore = require('redux').createStore
applyMiddleware = require('redux').applyMiddleware
compose = require('redux').compose
combineReducers = require('redux').combineReducers
thunkMiddleware = require('redux-thunk')
reduxReactRouter = require('redux-router').reduxReactRouter
routerStateReducer = require('redux-router').routerStateReducer
createHistory = require('history').createHistory
billingReducers = require('../reducers/BillingReducers')

reducer = combineReducers({
  router: routerStateReducer,
  billing: billingReducers
});

store = compose(
  applyMiddleware(thunkMiddleware),
  reduxReactRouter({ createHistory: createHistory }),
)(createStore)(reducer)

module.exports = store
