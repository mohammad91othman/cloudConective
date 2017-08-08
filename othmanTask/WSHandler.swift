//
//  WSHandler.swift
//  othmanTask
//
//  Created by Mohammad Othman on 8/4/17.
//  Copyright © 2017 Mohammad Othman. All rights reserved.
//

import UIKit
import Foundation

class WSHandler: NSObject {
    
    func convertToDictionary() -> [String: String]? {
        var dataString = ""
        let config = URLSessionConfiguration.default
        let userPasswordString = "admin@boot.com:admin"
        let userPasswordData = userPasswordString.data(using: String.Encoding.utf8)
        let base64EncodedCredential = userPasswordData!.base64EncodedString()
        let authString = "Basic \(base64EncodedCredential)"
        config.httpAdditionalHeaders = ["Authorization" : authString]
        let session = URLSession(configuration: config)
        
        if let url = URL(string: "http://34.208.106.205:8080/api/machine?page=0&size=10") {
            if let data = try? Data(contentsOf: url, options: []) {
                let json = JSON(data: data)
                print(json)
               // parseJSON(json)
                DispatchQueue.main.async(execute: {
                    
                });
            }
        }
        
        let url = NSURL(string: "http://34.208.106.205:8080/api/machine?page=0&size=10")
        let task = session.dataTask(with: url! as URL) {
            ( data, response, error) in
            if (response as? HTTPURLResponse) != nil {
                dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)! as String
           
            }
        }
        task.resume()
        
        if let data = dataString.data(using: .utf8) {
            do {
                var dic = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                print(dic)
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    

}
