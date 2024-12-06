import ItemData from "../viewmodel/ItemData"
import mainViewModel from '../viewmodel/MainViewModel';

@Preview
@Component
export default struct Setting {
  @Builder
  settingCell(item: ItemData) {
    Row() {
      Row() {
        Image(item.image)
          .height(22)
          .margin({
            left: 16,
            right: 12
          })
        Text(item.title)
          .fontSize(16)
      }

      if (item.others === undefined) {
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
        ForEach(mainViewModel.getSettingListData(), (item: ItemData) => {
          ListItem() {
            this.settingCell(item);
          }
          .height(48)
        }, (item: ItemData) => JSON.stringify(item))
      }
      .scrollBar(BarState.Off)
      .divider({
        strokeWidth: '1vp',
        color: '#0d000000',
        startMargin: '42vp',
        endMargin: '24vp'
      })
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