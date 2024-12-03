/*
  Banner 运营位由多张图片资源构成，因此创建 BannerClass 类用于表示每张图片资源的数据结构
 */
class BannerClass {
  /*
    图片资源唯一标识
   */
  id: string = '';
  /*
    图片地址
    ResourceStr 为 Resource 类型与 string 类型的联合类型
    Resource 类型在加载本地图片资源时会用到的，string 类型在加载网络图片资源时会用到
   */
  imageSrc: ResourceStr = '';
  /*
    图片跳转的在线网页地址
   */
  url: string = '';

  constructor(id: string, imageSrc: ResourceStr, url: string) {
    this.id = id;
    this.imageSrc = imageSrc;
    this.url = url;
  }
}

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

/*
  运营推荐位
 */

@Preview
// 用 @Preview 装饰器装饰，以便单独预览组件
@Component
struct Banner {
  @State bannerList: Array<BannerClass> = [
    new BannerClass('pic0', $r('app.media.banner_pic0'),
      'https://developer.huawei.com/consumer/cn/training/course/video/C101718352529709527'),
    new BannerClass('pic1', $r('app.media.banner_pic1'),
      'https://developer.huawei.com/consumer/cn/'),
    new BannerClass('pic2', $r('app.media.banner_pic2'),
      'https://developer.huawei.com/consumer/cn/deveco-studio/'),
    new BannerClass('pic3', $r('app.media.banner_pic3'),
      'https://developer.huawei.com/consumer/cn/arkts/'),
    new BannerClass('pic4', $r('app.media.banner_pic4'),
      'https://developer.huawei.com/consumer/cn/arkui/'),
    new BannerClass('pic5', $r('app.media.banner_pic5'),
      'https://developer.huawei.com/consumer/cn/sdk')
  ];

  build() {
    Swiper() {
      ForEach(this.bannerList, (item: BannerClass, index: number) => {
        Image(item.imageSrc)
          .objectFit(ImageFit.Contain) // 设置图片的填充效果为 Contain 模式，即保持宽高比进行缩小或放大
          .width('100%')
          .padding({ top: 11, left: 16, right: 16 })
          .borderRadius(16) // 设置图片四角的圆角值
      }, (item: BannerClass, index: number) => item.id)
    }
    .autoPlay(true) // 控制是否自动轮播子组件
    .loop(true) // 控制是否循环播放
    .indicator(
      new DotIndicator()
        .color('#1a000000')
        .selectedColor('#0A59F7')
    )
  }
}

/*
  赋能套件
  由文章标题、文章简介、文章配图组成
  分别建立三个组件将它们组合起来构建完整视图
 */

@Preview
@Component
struct EnablementItem {
  // 定义标题和简介
  private title: string = 'HarmonyOS第一课';
  private brief: string = '基于真实的开发场景，提供向导式学习，多维度融合课程等内容，给开发者提供全新的学习体验。';

  build() {
    Column() {
      Image($r('app.media.enablement_pic1'))
        .width('100%')
        .objectFit(ImageFit.Cover)
        .height(96)
        .borderRadius({
          topLeft: 16,
          topRight: 16
        })

      Text(this.title)
        .height(19)
        .width('100%')
        .fontSize(14)
        .textAlign(TextAlign.Start)
        .textOverflow({ overflow: TextOverflow.Ellipsis }) // 设置文本超长时的显示方式，Ellipsis：超长时使用省略号
        .maxLines(1) // 设置文本的最大行数
        .fontWeight(400)
        .padding({ left: 12, right: 12 })
        .margin({ top: 8 })

      Text(this.brief)
        .height(32)
        .width('100%')
        .fontSize(12)
        .textAlign(TextAlign.Start)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
        .maxLines(2)
        .fontWeight(400)
        .fontColor('rgba(0, 0, 0, 0.6)')
        .padding({ left: 12, right: 12 })
        .margin({ top: 2 })
    }
    .width(160)
    .height(169)
    .borderRadius(16)
    .backgroundColor(Color.White)
  }
}