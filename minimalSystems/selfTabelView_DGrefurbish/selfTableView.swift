import UIKit

class selfTableView: UIViewController {
    
    var w1 = UIScreen.mainScreen().bounds.size.width
    var h1 = UIScreen.mainScreen().bounds.size.height
    var num = 10
    
    private var tableView: UITableView!
    
    override func loadView() {
        super.loadView()
        
        tableView = UITableView(frame: CGRectMake(0, 100, w1, h1-100), style: .Plain)
        //实现两个代理
        tableView.dataSource = self
        tableView.delegate = self
        //自动布局
        tableView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        //分割线颜色
        tableView.separatorColor = UIColor(red: 230/255.0, green: 230/255.0, blue: 231/255.0, alpha: 1.0)
        //背景色
        tableView.backgroundColor = UIColor(red: 250/255.0, green: 250/255.0, blue: 251/255.0, alpha: 1.0)
        view.addSubview(tableView)
        
        //等待圆环
        let loadingView = DGElasticPullToRefreshLoadingViewCircle()
        //圆环颜色
        loadingView.tintColor = UIColor(red: 78/255.0, green: 221/255.0, blue: 200/255.0, alpha: 1.0)
        
        //下拉刷新调用的闭包
        tableView.dg_addPullToRefreshWithActionHandler({ [weak self] () -> Void in
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1.5 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
                self!.addCell()
            })
            }, loadingView: loadingView)
        //刷新区域的颜色
        tableView.dg_setPullToRefreshFillColor(UIColor(red: 57/255.0, green: 67/255.0, blue: 89/255.0, alpha: 1.0))
        tableView.dg_setPullToRefreshBackgroundColor(tableView.backgroundColor!)
    }
    
    //释放内存
    deinit {
        tableView.dg_removePullToRefresh()
    }
    
    func addCell() {
        testName.insert("Add", atIndex: 0)
        testcontent1.insert("this is add cell,this is add cell好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃好吃,this is add cell,this is add cell,this is add cell", atIndex: 0)
        self.tableView.reloadData()
        self.tableView.dg_stopLoading()
    }
    
}

extension selfTableView: UITableViewDataSource {
    
    //几个表
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    //多少行
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testName.count
    }
    
    //内容显示
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cells = selfCell(numdata:indexPath.row,reuseIdentifier: "tableView")
        return cells
        
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return CGFloat(getcellH)
    }
    
}

extension selfTableView: UITableViewDelegate {
    
    //选中某个cell
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}
