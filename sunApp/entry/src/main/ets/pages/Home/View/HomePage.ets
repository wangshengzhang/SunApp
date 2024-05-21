 @Entry
 @Component
 export struct HomePage {

   build() {
     Column(){
       Navigation() {
         // Image($r('app.media.icon_back')).width(32).height(32).margin({left:8,top:6,bottom:6})
         // Text('我的').width(222).height(22).fontSize($r('app.float.size_16'))
         // Row(){
         //
         // }.width('100%').height(60).backgroundColor($r('app.color.color_cb'))
       }.width('100%').backgroundColor(Color.Red).mode(NavigationMode.Auto)

     }.width('100%').height('100%').backgroundColor($r('app.color.color_cb'))

   }
  }