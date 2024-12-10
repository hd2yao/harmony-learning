import { common } from '@kit.AbilityKit';
import ItemData from '../viewmodel/ItemData';
import mainViewModel from '../viewmodel/MainViewModel';
import ListInfo from '../viewmodel/ResponseData/ListInfo';
import { HttpUtils } from '../common/network/HttpUtils';


@Preview
@Component
export default struct Home {
  @State httpGridItems: Array<ListInfo> = [];
  @State pictureUri: string = '';
  private context = getContext(this) as common.UIAbilityContext;
  private applicationContext = this.context.getApplicationContext();
  private cacheDir = this.applicationContext.filesDir;

  // 在 aboutToAppear 声明周期中，通过 postHttpRequest() 和 getHttpRequest() 方法分别获取到列表项中的文字以及图片数据源，和箭头图片的 uri
  async aboutToAppear(): Promise<void> {
    let httpUtil: HttpUtils = new HttpUtils();
    await httpUtil.postHttpRequest().then((value: Array<ListInfo>) => {
      this.httpGridItems = value;
    });
    await httpUtil.getHttpRequest(this.cacheDir).then((value:string) => {
      this.pictureUri = value;
    });
    httpUtil.destroyHttpResponse();
  }

  build() {
    Column() {
      Text('首页')
        .width('100%')
        .margin({
          top: '48vp',
          bottom: '12vp'
        })
        .fontWeight(700)
        .fontSize('26fp')
      
      Swiper() {
        ForEach(mainViewModel.getSwiperImages(), (image: Resource) => {
          Image(image)
            .width('100%')
            .borderRadius('16vp')
        }, (image: Resource) => JSON.stringify(image.id))
      }
      .autoPlay(true)

      Grid() {
        ForEach(mainViewModel.getFirstGridData(), (item: ItemData, index: number) => {
          GridItem() {
            Column() {
              Image(item.image)
                .width('40vp')
                .height('40vp')
              Text(item.title)
                .fontSize('12fp')
                .margin({ top: '4vp' })
            }
          }
        }, (item: ItemData, index: number) => JSON.stringify(item))
      }
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .rowsTemplate('1fr 1fr')
      .columnsGap('8vp')
      .rowsGap('12vp')
      .backgroundImage($r('app.media.backgroundImage'))
      .backgroundImageSize({
        width: '100%',
        height: '156vp'
      })
      .margin({ top: '12vp' })
      .padding({
        top: '12vp',
        bottom: '12vp'
      })
      .height('156vp')
      .backgroundColor(Color.White)
      .borderRadius('16fp')

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}