## Redux Example

Extremely simple POC of redux just to show how the different parts connect together.  It's written in Coffeescript with a Gulp build pipeline.  Of particular note, this example makes also makes use of some great redux packages:

- [react-router](https://github.com/rackt/react-router)
  - easy routing between different React components
- [redux-router](https://github.com/rackt/redux-router)
  - stores routing information within the app state
- [redux-thunk](https://github.com/gaearon/redux-thunk)
  - allows action creators to conditionally dispatch their own actions
