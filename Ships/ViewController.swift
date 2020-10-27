//
//  ViewController.swift
//  Ships
//
//  Created by Admin on 07.10.2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ships = Ships()
    let textView = UITextView()
    let pick = UIPickerView()
    var db = DB()
    
    enum TitleForSegment: String {
        case Battles = "Battles"
        case Ships = "Ships"
        case Outcomes = "Outcomes"
    }
    
    var segmentControll: UISegmentedControl = {
        let titles = ["Battles","Ships","Outcomes", "Full"]
        var segment = UISegmentedControl(items: titles)
        segment.backgroundColor = .systemYellow
        
        return segment
    }()
    
    
    
    fileprivate func createSegment() {
        segmentControll.addTarget(self, action: #selector(changeValue), for: .valueChanged)
        segmentControll.frame = CGRect(x: 20, y: self.view.frame.height - 100, width: self.view.frame.width - 40, height: 50)
        segmentControll.setWidth(segmentControll.frame.width / 4, forSegmentAt: 0)
        segmentControll.setWidth(segmentControll.frame.width / 4, forSegmentAt: 1)
        segmentControll.setWidth(segmentControll.frame.width / 4, forSegmentAt: 2)
        segmentControll.setWidth(segmentControll.frame.width / 4, forSegmentAt: 3)
        self.view.addSubview(segmentControll)
    }
    
    fileprivate func createTextView() {
        textView.frame = CGRect(x: 40, y: 30, width: self.view.frame.width, height: self.view.frame.height * 0.7)
        self.view.addSubview(textView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - create mainView
        makeTitleIcon()
        createTextView()
        createSegment()
        
        //MARK: - settings of picker
        pick.center = view.center
        pick.dataSource = self
        pick.delegate = self
        view.addSubview(pick)
        pick.isHidden = true
        
        
        print(db.openDB())
        
        print(Ships())
        //        print(db.gettingShipsList("Kongo"))
        //        print(db.gettingBattleList())
        textView.backgroundColor = .clear
        
        //        let battle = Battles().listOfBattle[0]
        //        let battleView = BattleView(battle)
        //        self.view.addSubview(battleView)
    }
    
    //MARK: - method of making ship icon in title
    private func makeTitleIcon() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "ship")
        
        imageView.image = image
        
        self.navigationItem.titleView = imageView
    }
    
    //MARK: - Value for each segment
    @objc func changeValue() {
        
        switch segmentControll.selectedSegmentIndex {
        case 0:
            pick.isHidden = true
            let battleSt: UIStoryboard = UIStoryboard(name: "BattleStoryboard", bundle: nil)
            let batVC = battleSt.instantiateViewController(withIdentifier: "BattleVC")
            self.navigationController?.pushViewController(batVC, animated: true)
        case 1:
            textView.text = ""
            //            var pick = UIPickerView(frame: CGRect(x: Int(view.center.x) - Int((view.frame.width / 3) / 2), y: Int(view.center.y), width: Int(view.frame.width / 3), height: Int(view.frame.height / 3)))
            
            pick.isHidden = false
            
            
        //view.addSubview(pick)
        // let ships = db.gettingShipsList(<#T##dbClass: String##String#>)
        
        //            textView.text = "Ships"
        case 2:
            pick.isHidden = true
            let storyboard: UIStoryboard = UIStoryboard(name: "OutcomesStoryboard", bundle: nil)
            let outcomeVC = storyboard.instantiateViewController(withIdentifier: "outcomesVC")
            self.navigationController?.pushViewController(outcomeVC, animated: true)
//            let textForOutomesSegment = db.gettingOutcomesList()
//            var resultText = ""
//            for value in textForOutomesSegment {
//                resultText += value + "\n"
//            }
//            textView.text = resultText
        case 3:
            pick.isHidden = true
            let storyboard: UIStoryboard = UIStoryboard(name: "ShipsStoryboard", bundle: nil)
            let shipVC = storyboard.instantiateViewController(withIdentifier: "shipsID")
            self.navigationController?.pushViewController(shipVC, animated: true)

        default:
            break
        }
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let result = db.gettingClassOfShips()
        return result.count + 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        var result = db.gettingClassOfShips()
        result.insert("All", at: 0)
        
        return result[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedIndex = pickerView.selectedRow(inComponent: 0)
        let result = db.gettingClassOfShips()
        
        
        //TODO: make models of ship, ships[], class, classes[], battle, battles[]
        func changeTextViewForShipsByClass() {
            if segmentControll.selectedSegmentIndex == 1 {
                textView.text = ""
                let newRes = db.gettingShipsList(result[selectedIndex - 1])
                var textInTextView = ""
                for value in newRes {
                    textInTextView += value + "\n"
                }
                textView.text = textInTextView
            } else {
                
            }
        }
        
        switch selectedIndex {
        case 0:
            let res = db.gettingShipsList()
            var newTextForTextView = ""
            for value in res {
                newTextForTextView += value + "\n"
            }
            textView.text = newTextForTextView
        case 1:
            changeTextViewForShipsByClass()
            
        case 2:
            changeTextViewForShipsByClass()
            
        case 3:
            changeTextViewForShipsByClass()
            
        case 4:
            changeTextViewForShipsByClass()
            
        case 5:
            changeTextViewForShipsByClass()
            
        case 6:
            changeTextViewForShipsByClass()
        case 7:
            changeTextViewForShipsByClass()
            
        default:
            break
        }
        
    }
    
}
