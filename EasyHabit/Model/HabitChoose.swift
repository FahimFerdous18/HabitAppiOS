//
//  HabitChoose.swift
//  EasyHabit
//
//  Created by BJIT on 1/28/22.
//

import Foundation
struct Userinfo{
    var icon: String
    var selecticon: String
    var hname: String
    
}

extension Userinfo {
    static let celldata = [
        Userinfo(icon: "Group-2", selecticon: "1", hname: "Add Custom"),
        Userinfo(icon: "reading", selecticon: "1", hname: "Reading Book"),
        Userinfo(icon: "walk", selecticon: "2", hname: "Walking"),
        Userinfo(icon: "drinking", selecticon: "2", hname: "Drinking water"),
        Userinfo(icon: "running", selecticon: "1", hname: "Running"),
        Userinfo(icon: "tv", selecticon: "1", hname: "Watch TV"),
        Userinfo(icon: "exercise", selecticon: "1", hname: "Exercise"),
        Userinfo(icon: "callfamily", selecticon: "1", hname: "Call to family"),
        Userinfo(icon: "food", selecticon: "1", hname: "Taking food"),
        Userinfo(icon: "reading", selecticon: "1", hname: "Reading book")
    ]
}
