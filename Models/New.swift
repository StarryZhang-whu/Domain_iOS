//
//  New.swift
//  Domain_iOS
//
//  Created by 张凌浩 on 2023/4/15.
//

import SwiftUI

struct New: Identifiable {
    let id = UUID()
    var index: Int
    var title: String
    var subtitle: String
    var text: String
    var image: String
    var background: String
    var logo: String
}

var news = [
    New(index: 1, title: "计科男篮，新生杯四强！", subtitle: "10月25日 周二", text: "金秋九月，阳光旭旭，武汉大学男篮新生杯拉开帷幕。", image: "篮球", background: "男篮封面", logo: "Logo"),
    New(index: 2, title: "1024，程序员节快乐！", subtitle: "10月26日 周三", text: "程序员节快乐，属于我们的节日。", image: "Illustration 3", background: "Background 4", logo: "Logo"),
    New(index: 3, title: "计算机学院迎新晚会", subtitle: "10月11日 周二", text: "霁色虹满，月升新繁。", image: "迎新晚会", background: "迎新晚会", logo: "logo"),
    New(index: 4, title: "网络部小课堂｜文字篇", subtitle: "10月19日 周三", text: "在了解了设计的四大原则和基本配色后，你是否还在为选择哪种字体而绞尽脑汁？", image: "Illustration 1", background: "推文封面", logo: "Logo"),
]

var featuredCourses = [
    New(index: 1, title: "计科男篮，新生杯四强！", subtitle: "10月25日 周二", text: "金秋九月，阳光旭旭，武汉大学男篮新生杯拉开帷幕。", image: "", background: "男篮", logo: "logo"),
    New(index: 2, title: "1024，程序员节快乐！", subtitle: "10月26日 周三", text: "程序员节快乐，属于我们的节日。", image: "Illustration 2", background: "Background 3", logo: "logo"),
    New(index: 3, title: "计算机学院迎新晚会", subtitle: "10月11日 周二", text: "霁色虹满，月升新繁。", image: "", background: "迎新晚会", logo: "logo"),
    New(index: 4, title: "网络部小课堂｜文字篇", subtitle: "10月19日 周三", text: "在了解了设计的四大原则和基本配色后，你是否还在为选择哪种字体而绞尽脑汁？", image: "Illustration 1", background: "推文封面", logo: "logo"),
]
