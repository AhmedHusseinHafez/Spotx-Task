# spotx

A Flutter job Task

The purpose of the task is to build a dynamic screen which can be
configured from api.

App should send a call to Configuration api and based on the response
build sections of the screen.

I Just Use Few Packages   
  http 
  flutter_bloc
  equatable

## Something I learned from the senior developer who gave me task
I Learned that Multi-Bloc Provider is not the best way, so use your bloc-provider only when you 
start use the widget you need instead of you creating an object for all providers in memory every time you start app.

Also I didn't use it null safty in best way but he notice that in my code, he advised me to read more about null safty.
