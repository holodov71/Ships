//
//  BattleCollectionViewController.swift
//  Ships
//
//  Created by Admin on 22.10.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class BattleCollectionViewController: UICollectionViewController {
    
    var battle = Battles().listOfBattle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Battles"
        let deleteButton = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.setTitleColor(.black, for: .normal)
        deleteButton.addTarget(self, action: #selector(createAlert), for: .touchUpInside)
        //        let barButton = UIBarButtonItem(image: nil, style: .done, target: self, action: #selector(deleteBattle))
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: deleteButton)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        
        // Register cell classes
        self.collectionView!.register(BattleCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        
        // Do any additional setup after loading the view.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    
    //    override func numberOfSections(in collectionView: UICollectionView) -> Int {
    //        // #warning Incomplete implementation, return the number of sections
    //        return 0
    //    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return battle.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! BattleCollectionViewCell
        
        cell.setCell(battle[indexPath.row], index: indexPath.row)
        cell.layer.borderWidth = 0.5
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        let vc = BattleVideoViewController(battle[indexPath.row])
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
    
}

extension BattleCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 50)
    }
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //            return CGSize(width: self.view.frame.width / 3, height: self.view.frame.height / 3)
    //        }
    
}

extension BattleCollectionViewController: ProtocolDB {
    @objc func createAlert() {
        let alert = UIAlertController(title: "Удаление", message: "Введите номер битвы", preferredStyle: .alert)
        var index: Int = -1
        
        alert.addTextField { (textField) in
            textField.placeholder = "Введите номер битвы"
            textField.borderStyle = .roundedRect
        }
        
        let action = UIAlertAction(title: "Ok", style: .default) { (textField) in
            index = Int(alert.textFields![0].text!) ?? -1
            let name = self.battle[index].name
            self.deleteFromBattle(name)
            self.battle.remove(at: index)
            self.collectionView.reloadData()
            print(index)
                
            }
            
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            
        }
}
