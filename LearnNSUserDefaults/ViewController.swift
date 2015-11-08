//
//  ViewController.swift
//  LearnNSUserDefaults
//
//  Created by 任 一杰 on 15/11/7.
//  Copyright © 2015年 任一杰. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate
{
    
    var scrollView = UIScrollView()
    var pageControl = UIPageControl()
    var btn = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //配置pageControl
        pageControl.center = CGPointMake(self.view.frame.width/2, self.view.frame.height-30)
        pageControl.currentPageIndicatorTintColor = UIColor.redColor()
        pageControl.pageIndicatorTintColor = UIColor.whiteColor()
        pageControl.numberOfPages = 4
        pageControl.addTarget(self, action: "scrollViewDidEndDecelerating", forControlEvents: UIControlEvents.ValueChanged)
        //配置scrollView
        scrollView.frame = self.view.bounds
        scrollView.contentSize = CGSizeMake(4*self.view.frame.width, 0)
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        for var i=0;i<4;i++ {
            let image = UIImage(named: "\(i+1)")
            let imageView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
            imageView.image = image
            var frame = imageView.frame
            frame.origin.x = CGFloat(i)*frame.size.width
            imageView.frame = frame
            scrollView.addSubview(imageView)
            self.view.addSubview(pageControl)
        }
        //如果不做动画效果,可以用如下代码
        //        //配置按钮
        //        //要在第4个页面添加按钮,注意X坐标为:3*self.view.frame.width
        //        btn.frame = CGRectMake(3*self.view.frame.width, self.view.frame.height - 100, self.view.frame.width, 50)
        //        btn.setTitle("开启Swift之旅", forState: UIControlState.Normal)
        //        btn.titleLabel?.font = UIFont.systemFontOfSize(20)
        //        btn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
        //        btn.backgroundColor = UIColor.orangeColor()
        //        btn.addTarget(self, action: "buttonClick:", forControlEvents: UIControlEvents.TouchUpInside)
        //        //注意把按钮添加到scrollView上,不要添加到imageView上,会无法点击
        //        scrollView.addSubview(btn)
    }
    
    //按钮点击事件
    func buttonClick(button:UIButton)
    {
        //界面的跳转
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = sb.instantiateViewControllerWithIdentifier("second")
        self.presentViewController(secondVC, animated: true, completion: nil)
    }
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / self.view.frame.size.width)    //获取当前页数
        pageControl.currentPage = index
        //在这里添加按钮的渐入效果,当页面滑到第4页时出现
        if(index == 3)
        {
            self.btn.frame = CGRectMake(3*self.view.frame.width, self.view.frame.height, self.view.frame.width, 50)
            self.btn.setTitle("开启Swift之旅", forState: UIControlState.Normal)
            self.btn.titleLabel?.font = UIFont.systemFontOfSize(20)
            self.btn.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
            self.btn.backgroundColor = UIColor.orangeColor()
            self.btn.alpha = 0
            self.btn.addTarget(self, action: "buttonClick:", forControlEvents: UIControlEvents.TouchUpInside)
            UIView.animateWithDuration(1.5, delay: 0.5, options: UIViewAnimationOptions.CurveEaseInOut, animations: { () -> Void in
                self.btn.frame = CGRectMake(3*self.view.frame.width, self.view.frame.height-100, self.view.frame.width, 50)
                self.btn.alpha = 1
                //注意把按钮添加到scrollView上,不要添加到imageView上,会无法点击
                self.scrollView.addSubview(self.btn)
                }, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

























