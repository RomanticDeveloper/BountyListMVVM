//
//  DetailViewController.swift
//  BountyList
//
//  Created by Minseok Bang on 2020/11/09.
//

import UIKit

class DetailViewController: UIViewController {
    
    //MVVM
    
    //Model
    //BountyLifo
    
    //View
    // --imgView, nameLabel, bountyLabel
    // > view 들은 viewModel을 통해서 구성되기
    
    //ViewModel
    // -- DetailViewModel
    // > 뷰레이어에서 필요한 메서드 만들기
    // > 모델 가지고 있기 ,, BountyInfo 들
    
    
    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
//    var name: String?
//    var bounty: Int?
//    var bountyInfo: BountyInfo?
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        if let bountyInfo = self.viewModel.bountyInfo {
            imgView.image = UIImage(named: "\(bountyInfo.name).jpg")
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }

    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}


class DetailViewModel {
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo) {
        bountyInfo = model
    }
}
