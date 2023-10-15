Sample iOS app based on Project 5 from  [100 Days of Swift](https://www.hackingwithswift.com/100). E2E tests recoreded via [Maestro Studio](https://maestro.mobile.dev/getting-started/maestro-studio)


Run Maestro flows locally

1. Follow instructions https://maestro.mobile.dev/getting-started/installing-maestro

2. Execute commands
```
cd maestro
maestro test Flow.yaml
```

*should run tests on default iOS Simulator, if not pass identifier of booted Simulator for example:
```
maestro --device 652D7402-D88A-432C-B444-AB011FF8AC16 test Flow.yaml
```
