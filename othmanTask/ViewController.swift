
//
//  ViewController.swift
//  othmanTask
//
//  Created by Mohammad Othman on 8/4/17.
//  Copyright © 2017 Mohammad Othman. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource
{
    var namesArray = [String]()
    var idArray = [String]()
    var namesArray2 = [String]()
    var idArray2 = [String]()
    var sectionsArray = [String]()
    
    @IBOutlet weak var contentTableView: UITableView!
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var all: UIButton!
    @IBOutlet weak var down: UIButton!
    @IBOutlet weak var active: UIButton!
    @IBOutlet weak var allLocations: UIButton!
    
    @IBOutlet weak var profileImage: UIImageView!
  
    override func viewDidLoad()
    {
        super.viewDidLoad()
      
        self.searchBar.layer.cornerRadius = 10
        self.searchBar.layer.borderWidth = 1;
        self.searchBar.layer.borderColor = UIColor.lightGray.cgColor
       
        self.all.layer.cornerRadius = 10
        self.all.layer.borderWidth = 1
        self.all.layer.borderColor = UIColor.lightGray.cgColor
        
        self.active.layer.cornerRadius = 10
        self.active.layer.borderWidth = 1
        self.active.layer.borderColor = UIColor.lightGray.cgColor
        
        self.down.layer.cornerRadius = 10
        self.down.layer.borderWidth = 1
        self.down.layer.borderColor = UIColor.lightGray.cgColor
        
        self.allLocations.layer.cornerRadius = 10
        self.allLocations.layer.borderWidth = 1
        self.allLocations.layer.borderColor = UIColor.lightGray.cgColor
        
        self.profileImage.layer.cornerRadius = self.profileImage.frame.size.width / 2
        self.profileImage.clipsToBounds = true;
        
        let config = URLSessionConfiguration.default
        let userPasswordString = "admin@boot.com:admin"
        let userPasswordData = userPasswordString.data(using: String.Encoding.utf8)
        let base64EncodedCredential = userPasswordData!.base64EncodedString()
        let authString = "Basic \(base64EncodedCredential)"
        config.httpAdditionalHeaders = ["Authorization" : authString]
        let session = URLSession(configuration: config)
        
        let url = NSURL(string: "http://34.208.106.205:8080/api/machine?page=0&size=10")
        let task = session.dataTask(with: url! as URL) {
            ( data, response, error) in
            if (response as? HTTPURLResponse) != nil {
                let json1 = JSON(data:data!)
                
                 let modelID = json1["content"][0]["model"]["id"].stringValue
                    let modelName = json1["content"][0]["model"]["name"].stringValue
                    let locationID = json1["content"][0]["location"]["id"].stringValue
                    let locationName = json1["content"][0]["location"]["name"].stringValue
                    let statusID = json1["content"][0]["status"]["id"].stringValue
                    let statusValue = json1["content"][0]["status"]["statusValue"].stringValue
                    let typeID = json1["content"][0]["type"]["id"].stringValue
                    let machineTypeName = json1["content"][0]["type"]["machineTypeName"].stringValue
                
                self.sectionsArray.append(json1["content"][0]["name"].stringValue)
                self.sectionsArray.append(json1["content"][1]["name"].stringValue)
                    
                    self.idArray.append(modelID)
                    self.idArray.append(locationID)
                    self.idArray.append(statusID)
                    self.idArray.append(typeID)
                    
                    self.namesArray.append(modelName)
                    self.namesArray.append(locationName)
                    self.namesArray.append(statusValue)
                    self.namesArray.append(machineTypeName)
                
                let modelID2 = json1["content"][1]["model"]["id"].stringValue
                let modelName2 = json1["content"][1]["model"]["name"].stringValue
                let locationID2 = json1["content"][1]["location"]["id"].stringValue
                let locationName2 = json1["content"][1]["location"]["name"].stringValue
                let statusID2 = json1["content"][1]["status"]["id"].stringValue
                let statusValue2 = json1["content"][1]["status"]["statusValue"].stringValue
                let typeID2 = json1["content"][1]["type"]["id"].stringValue
                let machineTypeName2 = json1["content"][1]["type"]["machineTypeName"].stringValue
                
                self.idArray2.append(modelID2)
                self.idArray2.append(locationID2)
                self.idArray2.append(statusID2)
                self.idArray2.append(typeID2)
                
                self.namesArray2.append(modelName2)
                self.namesArray2.append(locationName2)
                self.namesArray2.append(statusValue2)
                self.namesArray2.append(machineTypeName2)
            
                DispatchQueue.main.async{
                    self.contentTableView.reloadData()
                }
            }
        }
        
        task.resume()
    }
   
    // MARK: UICollectionViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {   if section == 1
        {
        return "All Server"
        }
    else
        {
        return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = contentTableView.dequeueReusableCell(withIdentifier: "cellIDE", for: indexPath) as! cellTableViewCell
        if self.idArray.count != 0 {
            if indexPath.section == 0 {
                
           cell.typeA.text = namesArray[indexPath.row]
            cell.type2.text = namesArray[indexPath.row]
                cell.name.text = sectionsArray[0];
            }
            if indexPath.section == 1 {
                cell.typeA.text = namesArray2[indexPath.row]
                cell.type2.text = namesArray2[indexPath.row]
                 cell.name.text = sectionsArray[1];
            }
        }
        return cell
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

