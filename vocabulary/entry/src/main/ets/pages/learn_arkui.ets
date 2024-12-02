@Entry
@Component
struct Hello {
  @State myText: string = 'World'

  build() {
    Column() {
      Text(`Hello, ${this.myText}`)
        .fontSize(50)
      Divider()
      Button('Click me')
        .onClick(() => {
          this.myText = 'ArkUI'
        })
        .height(50)
        .width(100)
        .margin({top:20})
    }
  }
}