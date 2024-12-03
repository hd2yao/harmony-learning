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

      Banner()
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F1F3F5') // 整体组件背景
  }
}

@Preview
// 用 @Preview 装饰器装饰，以便单独预览组件
@Component
struct Banner {
  build() {
    Image($r('app.media.banner_pic1'))
      .objectFit(ImageFit.Contain) // 设置图片的填充效果为 Contain 模式，即保持宽高比进行缩小或放大
      .width('100%')
      .padding({ top: 11, left: 16, right: 16})
      .borderRadius(16) // 设置图片四角的圆角值
  }
}