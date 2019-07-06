//
//  ViewController.swift
//  Practica6
//
//  Created by CTA CUCEA on 6/14/19.
//  Copyright © 2019 MTI CUCEA. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var users = [UserModel]()
    var selectedUser: UserModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        loadUsers()
    }
    func loadUsers(){
        
        AF.request("https://jsonplaceholder.typicode.com/users").responseJSON { response in
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            
            //if let json = response.result.value {
                //print("JSON: \(json)") // serialized json response
            
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)") // original server data as UTF8 string
                
                let json = JSON(data)
                for user in json {
                    self.users.append(UserModel(object: user.1))
                }
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "usuario") as! UserTableViewCell
        cell.lblName.text = users[indexPath.row].username
        cell.lblPhone.text = users[indexPath.row].phone
        
        
        //cell?.textLabel?.text = users[indexPath.row].username
        //cell?.detailTextLabel?.text = "\(users[indexPath.row].street!), \(users[indexPath.row].city!)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedUser = users [indexPath.row]
        performSegue(withIdentifier: "ubicacion", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ubicacion" {
            let vc = segue.destination as! MapaViewController
            vc.user = selectedUser
        }
    }
}
