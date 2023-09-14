//
//  ViewController.swift
//  webcontent
//
//  Created by SHYNU MARY VARGHESE on 2023-09-14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var htmlWebView: UIWebView!
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let urlWeb = URL(string: "https://github.com"){
            webView.loadRequest(URLRequest(url: urlWeb))
        }
       
//        htmlWebView.loadHTMLString("<H1>Hello world</H1>", baseURL: nil)
        //Web content---networking
        guard let url = URL(string: "https://github.com") else { return  }
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [self] data, request, error in
            if let error = error{
                print(error)
            }
            else
            {
                if let unWrappedData = data{
                    let dataString = NSString(data: unWrappedData, encoding: String.Encoding.utf8.rawValue)
                    print(dataString)
                    DispatchQueue.main.sync(execute: {
                        //ui
                        htmlWebView.loadHTMLString(dataString as! String, baseURL: nil)
                    })
                }
            }
            
        }
        task.resume()
    }
    
    
    

}

