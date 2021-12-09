# registration_x


## Architecture - 

MVVM architecture is used in this project. View model works with Mobx state management tool in order to update the state of the UI.
Viewmodel has some dependancies that are injected by dependancy injection library (get it) from the main method.

inside viewmodel/model, I have create contract for validation so that view model can be completely independent to other layers.

### State management - 
Mobx state management is used in this project. Mobx_codegen and build_runner dev depandancies are used for code genration for mobx viewmodel/controllers.


### How to run project -

- Open proejct
- get depandancies - flutter pub get
- run command  - flutter pub run build_runner build
- flutter run





