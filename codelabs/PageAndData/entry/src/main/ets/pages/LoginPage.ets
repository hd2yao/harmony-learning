@Extend(TextInput)
function inputStyle() {
  .placeholderColor('#99182431')
    .height('45vp')
    .fontSize('18fp')
    .backgroundColor('#F1F3F5')
    .width('100%')
    .margin({ top: 12 })
}

@Extend(Line)
function lineStyle() {
  .width('100%')
  .height('1vp')
  .backgroundColor('#33182431')
}

@Entry
@Component
struct LoginPage {
  build() {
    Column() {
      Image($r('app.media.logo'))
        .width(78)
        .height(78)
        .margin({ top: 150, bottom: 8 })

      Text('登录界面')
        .fontSize(24)
        .fontWeight(FontWeight.Medium)
        .fontColor('#182431')
      Text('登录账号以使用更多服务')
        .fontColor(16)
        .fontColor('#99182431')
        .margin({ bottom: 30, top: 8})

      TextInput({ placeholder: '账号' })
        .type(InputType.Number)
        .maxLength(11)
        .inputStyle()
      Line()
        .lineStyle()
      TextInput({ placeholder: '密码' })
        .type(InputType.Password)
        .maxLength(8)
        .inputStyle()
      Line()
        .lineStyle()

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