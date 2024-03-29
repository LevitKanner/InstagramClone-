//
//  searchVC.swift
//  instagramClone
//
//  Created by Levit Kanner on 10/09/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import UIKit
import Firebase
private let searchIdentifier = "searchIdentifier"

class searchVC: UITableViewController {
    
    //Mark : Properties
    var users = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationController()
        
        //Register subclasses
        self.tableView!.register(searchUserCell.self, forCellReuseIdentifier: searchIdentifier)
        
//        //Separator inset clears part of separator lines
//        tableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        
        //Clears separator lines
        tableView.separatorColor = .clear
        
        //fetch users
        fetchUsers()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return users.count
    }

    
    // Configure cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchCell = tableView.dequeueReusableCell(withIdentifier: searchIdentifier, for: indexPath) as! searchUserCell
        searchCell.user = users[indexPath.row]
        return searchCell
    }

    
    
    //Gets called each time a particular row is selected
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        
        // Create instance of user profile Vc
        let userVC = userProfileVC(collectionViewLayout: UICollectionViewFlowLayout())
        navigationController?.pushViewController(userVC, animated: true)
        
        //Passes user from searchVC to user profile
        userVC.user = user
    }
    
    
    
    
    
    
    //Mark : - Handlers
    func configureNavigationController (){
        self.navigationItem.title = "Explore"
    }
    
    
    //Mark : API
    func fetchUsers(){
        Database.database().reference().child("users").observe(.childAdded) { (snapshot) in
            let uid = snapshot.key
            Database.fetchUser(with: uid, completion: { (user) in
                //Append user to data source
                self.users.append(user)
                self.tableView.reloadData()
            })
        }
    }
}
