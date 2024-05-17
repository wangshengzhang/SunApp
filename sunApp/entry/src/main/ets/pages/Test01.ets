
    class ButtonStates {
        width : number
        value : string
        constructor(width:number,value:string) {
          this.width = width
          this.value = value
        }
    }

    @Component
    struct MyGreenButton{
        @Link buttonStates : ButtonStates
        build(){
           Button(this.buttonStates.value).backgroundColor(Color.Green).width(this.buttonStates.width).height(100).fontWeight("")
               .fontColor('#FFFFFF，90%').onClick(()=>{
               if (this.buttonStates.width < 700) {
                   this.buttonStates.width += 120
               }else {
                   this.buttonStates = new ButtonStates(120,"红色按钮")
               }
           })
        }
    }

    @Component
    struct MyRedButton{
        @Link
        value : string
        @Link
        buttonWidth : number

        build(){
            Button('this.value').width(this.buttonWidth).height(100)
                .fontColor('#FFFFFF，90%')
                .fontWeight(20).backgroundColor(Color.Red).onClick(()=>{
                this.buttonWidth = 100
            })
        }
    }

    @Entry
    @Component
    struct  Test01{
        @State
        redButtonState : ButtonStates = new ButtonStates(100,"红色按钮")

        @State
        value :string = "绿色按钮"

        @State
        buttonWidth : number = 100

        build(){

           Column({space:30}) {

               Button("这个是红色的父类组件").height(100).width(300).backgroundColor(Color.Red).fontColor(Color.Black)
                   .onClick(()=>{
                    this.redButtonState.width += 50
                    this.redButtonState.value = "${redButtonStat.value}"
               })

               Button("这个是蓝色的父类组件").height(100).width(300).backgroundColor(Color.Green).fontColor(Color.Black).onClick(()=>{

                   this.value = "这个是红色的问题"
                   this.buttonWidth += 50

               })

               Divider().height(5).width('100%')

               MyGreenButton({buttonStates: $redButtonState}).width(this.redButtonState.width).height(80)

               MyRedButton({buttonWidth:$buttonWidth,value:$value}).width(300).height(80)

           }.padding({top:40}).alignItems(HorizontalAlign.Center).width('100%').height('100%')
        }
    }

