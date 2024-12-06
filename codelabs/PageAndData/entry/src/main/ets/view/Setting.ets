@Preview
@Component
export default struct Setting {
  build() {
    Column() {
      Text('我的')
        .width('100%')
        .margin({
          top: 48,
          bottom: 12
        })
        .fontWeight(700)
        .fontSize(26)


      Row() {
        Image($r('app.media.account'))
          .width(48)
          .height(48)
        Column() {
          Text('李先生')
            .fontSize(20)
          Text('2000000@test.cc')
            .fontSize(12)
            .margin({ top: 4 })
        }
        .alignItems(HorizontalAlign.Start)
        .margin({ left: 12 })
      }
      .alignItems(VerticalAlign.Center)
      .width('100%')

      List() {

      }

      Button('退出登录')
        .onClick(() => {

      })
    }
    .width('100%')
    .height('100%')
  }
}