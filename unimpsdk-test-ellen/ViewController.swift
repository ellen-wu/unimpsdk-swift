//
//  ViewController.swift
//  unimpsdk-test-ellen
//
//  Created by mac on 2021/11/17.
//

import UIKit

class ViewController: UIViewController {
    
    let UNIAPP_ID = "__UNI__3A6E687"
    
    var uniMPInstance: DCUniMPInstance?
    
    @IBAction func go2Uni(_ sender: Any) {
        if self.uniMPInstance != nil {
            self.uniMPInstance?.close(completion: { (result, error) in
            })
        }
        
        let config = DCUniMPConfiguration.init()
        // 允许后台运行
        config.enableBackground = true
        
        DCUniMPSDKEngine.openUniMP(UNIAPP_ID, configuration: config) { (uniMPInstance: DCUniMPInstance?, error: Error?) in
            if uniMPInstance != nil {
                self.uniMPInstance = uniMPInstance

                print("=== success")
            } else {
                print(error)
            }
        }
    }
    
    deinit {
        self.uniMPInstance = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if uniMPInstance != nil {
            uniMPInstance?.close(completion: { (result, error) in
            })
        }
        // Do any additional setup after loading the view.
    }
}

