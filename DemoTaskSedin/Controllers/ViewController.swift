//
//  ViewController.swift
//  DemoTaskSedin
//
//  Created by Shadab Hussain on 13/02/22.
//

import UIKit

class ViewController: UIViewController,ReloadTableProtocol {
    func reloadTable() {
        myTableView.reloadData()
    }
    

    @IBOutlet weak var myTableView: UITableView!
    var viewModelUser:UserViewModel?
    var myData: [UserData]? {
        return viewModelUser?.arrUser
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelUser = UserViewModel()
        viewModelUser?.delegate = self
        myTableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "MyTableViewCell")
        viewModelUser?.getAllUserData()
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myTableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as? MyTableViewCell else {return UITableViewCell()}
        if let modelUser = viewModelUser?.getDataForIndex(forIndex: indexPath.row) {
            cell.cellConfig(data: modelUser)
            viewModelUser?.downloadImages(imageURL: modelUser.user?.avatar_url ?? "", completion: { (image) in
                DispatchQueue.main.async {
                    cell.myImageView.image = image
                }
            }, failure: { (error) in
                //
            })
            
        }
        return cell
    }
    
    
}

