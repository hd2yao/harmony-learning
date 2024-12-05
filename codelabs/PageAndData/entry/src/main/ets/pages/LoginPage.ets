@Entry
@Component
struct LoginPage {


  build() {
    Column() {
      Image($r('app.media.logo'))
        .width(78)
        .height(78)
        .margin({ top: '150vp', bottom: '8vp' })

      Text('登录界面')
        .fontSize(24)
        .fontWeight(FontWeight.Medium)
        .fontColor('#182431')
      Text('登录账号以使用更多服务')
        .fontColor(16)
        .fontColor('#99182431')
        .margin({ bottom: 30, top: 8})

      TextInput()

      TextInput()

      Row() {
        Text()

        Text()

      }
      .justifyContent(FlexAlign.SpaceBetween)

      Button('')
      Text()

      Row() {

      }
      .justifyContent(FlexAlign.SpaceAround)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}