Reason for this project:
- Office JDK image too big for server applications. So the following modules are removed
  - desktop
  - accessibility
- Office JRE image lacks tools which are very useful for developers to debug, like `jps`, `jstack`
- Integrate with useful tools
  - [gosu](https://github.com/tianon/gosu)
  - [arthas](https://github.com/alibaba/arthas)

## Build and Test:
`cd` to JDK version you want and run `build_<platform>.sh`.

