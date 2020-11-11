//
//  BountyViewController.swift
//  BountyList
//
//  Created by Minseok Bang on 2020/11/09.
//

import UIKit

class BountyViewController: UIViewController,
                            UITableViewDataSource, UITableViewDelegate {
    
    //MVVM
    
    //Model
    //BountyLifo
    
    
    //View
    // --ListCell
    // > ListCell 에 필요한 정보를 View Model 에게서 받아야함
    // > ListCell 은 ViewModel 에서 받은 정보로 뷰 업데이트를 해야하겠다
    
    //ViewModel
    // -- BountyViewModel
    // > BountyViewModel 을 만들고, 뷰레이어에서 필요한 메서드 만들기
    // > 모델 가지고 있기 ,, BountyInfo 들
    
    
//    let bountyInfoList: [BountyInfo] = [
//        BountyInfo(name: "brook", bounty: 3300000),
//        BountyInfo(name: "chopper", bounty: 3300000),
//        BountyInfo(name: "franky", bounty: 50),
//        BountyInfo(name: "luffy", bounty: 4400000),
//        BountyInfo(name: "robin", bounty: 300000000),
//        BountyInfo(name: "nami", bounty: 160000000),
//        BountyInfo(name: "sanji", bounty: 80000000),
//        BountyInfo(name: "zoro", bounty: 120000000),
//        BountyInfo(name: "younguk", bounty: 30)
//    ]
//
    
    let viewModel = BountyViewModel()

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                let bountyInfo = viewModel.bountyInfo(at: index)
                vc?.viewModel.update(model: bountyInfo)
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return bountyInfoList.count
        return viewModel.numOfBountyInfoList
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
//        let img = UIImage(named: "\(bountyInfoList[indexPath.row].name).jpg")
//        cell.imageView?.image = img
//        cell.nameLabel.text = bountyInfoList[indexPath.row].name
//        cell.bountyLabel.text = "\(bountyInfoList[indexPath.row].bounty)"
//        return cell
        
        let bountyInfo = viewModel.bountyInfo(at: indexPath.row)
        let img = UIImage(named: "\(bountyInfo.name).jpg")
//        cell.imageView?.image = img
//        cell.nameLabel.text = bountyInfo.name
//        cell.bountyLabel.text = "\(bountyInfo.bounty)"
        
        cell.update(info: bountyInfo)
        return cell
    }
    
    //UITableViewDelddegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("---> \(indexPath)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}



class ListCell: UITableViewCell{
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    func update(info: BountyInfo) {
        imageView?.image = info.image
        nameLabel.text = info.name
        bountyLabel.text = "\(info.bounty)"
    }
}


