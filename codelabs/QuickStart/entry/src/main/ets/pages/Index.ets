@Entry
@Component
struct Index {
  @State message: string = '快速入门';

  build() {
    Column() {
      Text(this.message)
        .fontSize(24)
        .fontWeight('700')
        .width('100%') // 修改文本与屏幕左侧边距，Text 组件宽度设置为占满屏幕
        .textAlign(TextAlign.Start) // 设置文本对齐属性为 Start，左对齐
        .padding({ left: 16 })
        .fontFamily('HarmonyHeiTi-Bold')
        .lineHeight(33)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5') // 整体组件背景
  }
}