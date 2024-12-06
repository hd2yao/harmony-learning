import mainViewModel from '../viewmodel/MainViewModel';

@Preview
@Component
export default struct Home {
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

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F3F5')
  }
}