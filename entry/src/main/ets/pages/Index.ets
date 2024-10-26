// Index.ets
import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { CommonConstants } from '../contants/AppContants';
@Entry
@Component
struct Index {
  @State currentIndex: number = 0
  private scrollerForScroll: Scroller = new Scroller()
  @Builder
  tabBuilder(index: number, name: ResourceStr){
    Column(){
      Text(name)
        .fontColor(this.currentIndex === index? $r('app.color.active_font_color') : $r('app.color.font_color'))
        .fontSize($r('app.float.middle_font_size'))
        .fontWeight(this.currentIndex === index? CommonConstants.FONT_WEIGHT_FIVE : CommonConstants.FONT_WEIGHT_FOUR)
        .lineHeight($r('app.float.title_line_height'))
        .margin({
          top: $r('app.float.title_margin_top'),
          bottom: $r('app.float.title_margin_bottom')
        })
      Divider()
        .strokeWidth(CommonConstants.STROKE_WIDTH)
        .width($r('app.float.divider_width'))
        .color($r('app.color.active_font_color'))
        .opacity(this.currentIndex===index ? CommonConstants.FULL_OPACITY : CommonConstants.ZERO_OPACITY)
    }
  }

  @Builder
  listBuilder(listName: ResourceStr, tabName: ResourceStr, index: number){
    TabContent(){
      Text('tab')
    }
    .tabBar(this.tabBuilder(index, tabName))
  }


  build() {
    Column(){
      Text('翔安·荻花洲')
        .fontWeight(FontWeight.Bold)
        .fontSize($r('app.float.big_font_size'))
        .height($r('app.float.list_item_height'))
        .textAlign(TextAlign.Start)
        .width(CommonConstants.FULL_WIDTH)
        .padding({
          left: $r('app.float.discover_left_padding'),
          bottom: $r('app.float.discover_bottom_padding'),
          top: $r('app.float.discover_top_padding'),
        })

      Stack({ alignContent: Alignment.Top}){
        Scroll(this.scrollerForScroll){
          Column(){
            Image($r('app.media.dihuazhou1'))
              .width(CommonConstants.FULL_WIDTH)
              .height('app.float.image_height')
              .borderRadius($r('app.float.list_item_radius'))
              .padding({
                left: $r('app.float.list_item_padding'),
                right: $r('app.float.list_item_padding')
              })
            Tabs(){
              this.listBuilder('位置服务', '位置服务', 0)
              this.listBuilder('地点介绍', '地点介绍', 1)
            }
            .barWidth($r('app.float.bar_width'))
            .onAnimationStart((_index: number, targetIndex: number, _event: TabsAnimationEvent)=>{
              this.currentIndex = targetIndex
            })
          }
        }
        .scrollBar(BarState.Off)
        .width(CommonConstants.FULL_WIDTH)
        .height(CommonConstants.FULL_HEIGHT)
      }
      .width(CommonConstants.FULL_WIDTH)
      .height(CommonConstants.STACK_HEIGHT)
    }
    .height(CommonConstants.FULL_HEIGHT)
    .backgroundColor($r('app.color.start_window_background'))
  }

}