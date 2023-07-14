//
//  ViewController.swift
//  Crawling_Xi
//
//  Created by 최영우 on 7/13/23.
//

import UIKit
import SwiftSoup

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        crawl()
    }
}

func crawl() {
    let url = URL(string: "https://new.land.naver.com/complexes/126726?ms=37.489144,127.025957,17&a=APT:PRE&e=RETAIL")
    guard let myURL = url else {return}
    
    do{
        let html = try String(URLSession: myURL, encoding: .utf8)
        let doc : Document = try SwiftSoup.parse(html)
        let headerTitle = try doc.title()
        print(headerTitle)
        
        let firstLinkTitles: Elements = try doc.select(".data").select("dd")
    } catch Exception.Error(let type, let message) {
        print("Message :  \(message)")
    } catch {
        print("error")
    }
}

