import ItemData from "./ItemData";

/**
 * 用于封装主页面所需要的所有数据源
 */
export class MainViewModel {
  //数据源修改为二维数组，可实现分组列表的页面效果
  getSettingListData(): Array<Array<ItemData>> {
    let settingListData: ItemData[][] = [
      [
        new ItemData(0, '推送通知', $r('app.media.news'), '切换按钮'),
      ],
      [
        new ItemData(1, '字体大小调节', $r('app.media.data')),
        new ItemData(2, '菜单设置', $r('app.media.menu')),
      ],
      [
        new ItemData(3, '清除缓存', $r('app.media.storage')),
        new ItemData(4, '隐私协议', $r('app.media.person_shield')),
      ],
      [
        new ItemData(5, '关于', $r('app.media.about')),
      ]
    ]
    return settingListData;
  }
}

export default new MainViewModel();