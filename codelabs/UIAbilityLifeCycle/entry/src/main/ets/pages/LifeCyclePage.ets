import Logger from '../common/util/Logger';
import CommonConstants from '../common/constants/CommonConstants';

@Entry
@Component
struct LifeCyclePage  {
  @State textColor: Color = Color.Black;

  /*
   在创建自定义组件的新实例后，在执行其 build() 之前执行
   该函数仅会在自定义组件实例创建后执行一次
   允许在 aboutToAppear 函数中改变状态变量，更改将在后续执行 build 函数中生效
   */
  aboutToAppear(): void {
    this.textColor = Color.Blue;
    Logger.info('[LifeCyclePage] LifeCyclePage aboutToAppear');
  }

  /*
    页面每次显示时触发一次，包括路由过程、应用进入前后台等场景
    仅 @Entry 修饰的自定义组件生效
   */
  onPageShow(): void {
    this.textColor = Color.Brown;
    Logger.info('[LifeCyclePage]  LifeCyclePage onPageShow');
  }

  /*
    页面每次隐藏时触发一次，包括路由过程、应用进入前后台等场景
    仅 @Entry 修饰的自定义组件生效
   */
  onPageHide() {
    Logger.info('[LifeCyclePage]  LifeCyclePage onPageHide');
  }

  /*
    当用户点击返回按钮时触发
    仅 @Entry 修饰的自定义组件生效
   */
  onBackPress() {
    this.textColor = Color.Red;
    Logger.info('[LifeCyclePage]  LifeCyclePage onBackPress');
    return false;
  }

  /*
   在自定义组件析构销毁之前执行
   该函数仅会在自定义组件实例创建后执行一次
   不允许在 aboutToDisappear 函数中改变状态变量
   */
  aboutToDisappear(): void {
    Logger.info('[LifeCyclePage]  LifeCyclePage aboutToDisappear');
  }

  build() {
    Column() {
      Text('Hello World')
        .fontSize(CommonConstants.DEFAULT_FONT_SIZE)
        .fontColor(this.textColor)
        .margin(CommonConstants.DEFAULT_MARGIN)
        .fontWeight(FontWeight.Bold)
    }
    .width(CommonConstants.FULL_WIDTH)
  }
}