### React YouTube SPA

I built this app after learning React and little of Redux. I decided I would put my knowledge to the test and build a app that combines both and a API. 

Out of this came this app, which allows you to search, play, and see suggested videos all on one page - without ever reloading. 

The most difficult challenge with this whole process was the implementation of Redux. If you miss a single little step, the errors on solving it can be quite difficult to figure out.

However, I came to realize that Redux is not that difficult to debug after all. This is the process you should use (with console.logs) to find the problem. Test every single one of these in order with console logs to see which piece isn't implementing correctly.

Action Creator --> Specific Reducer --> Redux Store --> mapStateToProps --> Update DOM (Container)

