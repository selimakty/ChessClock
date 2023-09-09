//
//  TimesViewController.swift
//  ChessClock
//
//  Created by Selim on 8.09.2023.
//

import UIKit

class TimesViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var times = Times()
    
    var chosenMin = 0
    var chosenPlus = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toTimer" {
            let vc = segue.destination as! TimerViewController
            vc.minute = chosenMin
            vc.plus = chosenPlus
        }
    }

    @IBAction func customGameButton(_ sender: Any) {
        let alert = UIAlertController(title: "⏱", message: nil, preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Cancel", style: .default,handler: nil)
        
        alert.addTextField {
            UITextField in
            UITextField.placeholder = "minute: "
            UITextField.keyboardType = .numberPad
        }
        alert.addTextField {
            UITextField in
            UITextField.placeholder = "plus: "
            UITextField.keyboardType = .numberPad
        }
        
        let submitButton = UIAlertAction(title: "Play", style: .default) { [self] UIAlertAction in
            let minField = alert.textFields![0] as UITextField
            let plusField = alert.textFields![1] as UITextField
            
            if let min = minField.text {
                chosenMin = Int(min) ?? 1
                
                if let plus = plusField.text{
                    chosenPlus = Int(plus) ?? 0
                    
                    performSegue(withIdentifier: "toTimer", sender: nil)
                }
            }
        }
        
        alert.addAction(cancelButton)
        alert.addAction(submitButton)
        present(alert,animated: true)
        
    }
    
}
extension TimesViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        times.timeArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TimesCell
        cell.design()
        
        cell.timeLabel.text = "\(times.timeArray[indexPath.row].minute) + \(times.timeArray[indexPath.row].plus)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        chosenMin = times.timeArray[indexPath.row].minute
        chosenPlus = times.timeArray[indexPath.row].plus
        
        performSegue(withIdentifier: "toTimer", sender: nil)
    }
    
}
extension UICollectionViewCell {
    func design() {
        layer.masksToBounds = true
        layer.cornerRadius = 7
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 0.2
    }
}
