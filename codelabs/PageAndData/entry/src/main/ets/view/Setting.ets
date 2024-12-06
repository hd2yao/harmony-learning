@Preview
@Component
export default struct Setting {
  @Builder
  settingCell(title: ResourceStr, img: Resource, others?: ResourceStr) {
    Row() {
      Row() {
        Image(img)
          .height(22)
          .margin({
            left: 16,
            right: 12
          })
        Text(title)
          .fontSize(16)
      }

      if (others === undefined) {
        Image($r('app.media.right_grey'))
          .width('12vp')
          .height('24vp')
      } else {
        Toggle({ type: ToggleType.Switch, isOn: false })
      }
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .padding({
      left: '8vp',
      right: '22vp'
    })
}

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
        ListItem() {
          this.settingCell('推送通知', $r('app.media.news'), '切换按钮');
        }
        .height(48)

        ListItem() {
          this.settingCell('字体大小调节', $r('app.media.data'));
        }
        .height(48)

        ListItem() {
          this.settingCell('清除缓存', $r('app.media.storage'));
        }
        .height('48vp')

        ListItem() {
          this.settingCell('隐私协议', $r('app.media.person_shield'));
        }
        .height('48vp')

        ListItem() {
          this.settingCell('关于', $r('app.media.about'));
        }
        .height('48vp')
      }
      .backgroundColor('#ffffff')
      .borderRadius('16vp')
      .width('100%')
      .padding({
        top: '4vp',
        bottom: '4vp'
      })

      Button('退出登录')
        .onClick(() => {

      })
    }
    .width('100%')
    .height('100%')
  }
}