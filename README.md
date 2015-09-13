# WaterFallUtil

swift2.0 瀑布流展示
使用步骤
###1.导入WaterFallLayout.swift文件

###2.1若全屏展示，则直接使用代码

    let wfv:WaterFallLayout = WaterFallLayout()<br />
    view.addSubview(wfv.scrollVew)<br />

###2.2若在制定view展示（首先需要获取该view，本例使用tag，也可自己手动写入）<br />

    let targetView = view.viewWithTag(11)! as UIView<br />
    targetView.backgroundColor = UIColor.greenColor()<br />
    //重新改变大小<br />
    wfv = WaterFallLayout(frame: CGRect(x: 0, y: 0, width: targetView.bounds.width, height: targetView.bounds.height))<br />
    targetView.addSubview(wfv.scrollVew)<br />

###3.往瀑布流中添加内容<br />

    为了最大兼容性，加入的内容只需要继承UIView或其子类即可。使用方法：<br />
    wfv.addCustomSubView(UIView())
###4.自定义部分：<br />

    在WaterFallLayout.swift文件中，有一个constants结构体，里面的内容可自定义，详情请看代码
