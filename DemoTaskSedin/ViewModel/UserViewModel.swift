//
//  UserViewModel.swift
// DemoTaskSedin
//
//  Created by Shadab Hussain on  13/02/22.
//

import Foundation
import Alamofire
protocol ReloadTableProtocol: class {
    func reloadTable()
}
class UserViewModel {
    var arrUser: [UserData] = []
   weak var delegate: ReloadTableProtocol?
    func getAllUserData() {
        AF.request("https://api.github.com/repos/Alamofire/Alamofire/issues").response { response in
            if let data = response.data {
                print(response.data)
                do{
                    let userResponse = try? JSONDecoder().decode([UserData].self, from: data)
                    if let userData = userResponse {
                        self.arrUser.append( contentsOf: userData)
                        print(self.arrUser)
                    }
                    DispatchQueue.main.async {
                        self.delegate?.reloadTable()
                    }
                 
                } catch let err {
                    print(err.localizedDescription)
                    
                }
            }
            
        }
    }
    
    func downloadImages(imageURL: String, completion: @escaping (UIImage) -> (), failure: @escaping (String) -> () ) {

        AF.request(imageURL, method: .get)
            .validate()
            .responseData(completionHandler: { (responseData) in
                guard let data = responseData.data else {return}
                if let image = UIImage(data: data) {
                    completion(image)
                } else {
                   failure("Something went wrong")
                }
            })
    }

    
    func getDataForIndex(forIndex index: Int?) -> UserData? {
        guard let unwrappedIndex = index else {return nil}
        return arrUser[unwrappedIndex]
    }
}
