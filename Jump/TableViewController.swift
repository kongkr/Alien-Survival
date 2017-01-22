//
//  TableViewController.swift
//  Jump
//
//  Created by Nico Grenier on 08/12/2016.
//  Copyright © 2016 Nico Grenier. All rights reserved.
//

import UIKit

struct cellData {
    
    let cell:Int!
    let text:String!
    let image:UIImage!
}


class TableViewController: UITableViewController {
    
    var arrayOfCellData = [cellData]()

    override func viewDidLoad() {
        arrayOfCellData = [cellData(cell : 1, text: "Play", image: #imageLiteral(resourceName: "hudPlayer_yellow")),
                           cellData(cell : 2, text: "Stats", image : #imageLiteral(resourceName: "hudJewel_green")),
                           cellData(cell : 3, text: "Settings", image : #imageLiteral(resourceName: "hudKey_green"))]
        
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "colored_grass"))
        
        self.navigationController?.isToolbarHidden = false
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if arrayOfCellData[indexPath.row].cell == 1 {
            let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "playCell")
            cell.imageView?.image = arrayOfCellData[indexPath.row].image
            cell.textLabel?.text = arrayOfCellData[indexPath.row].text
            cell.textLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 30)
            cell.textLabel?.textAlignment = .center
            cell.backgroundColor = .clear

            return cell
        } else if arrayOfCellData[indexPath.row].cell == 3 {
            let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "settingCell")
            
            cell.imageView?.image = arrayOfCellData[indexPath.row].image
            cell.textLabel?.text = arrayOfCellData[indexPath.row].text
            cell.textLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 30)
            cell.textLabel?.textAlignment = .center
            cell.backgroundColor = .clear
            
            return cell
        } else {
            let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "statsCell")
            
            cell.imageView?.image = arrayOfCellData[indexPath.row].image
            cell.textLabel?.text = arrayOfCellData[indexPath.row].text
            cell.textLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 30)
            cell.textLabel?.textAlignment = .center
            cell.backgroundColor = .clear
            
            /*let cell = Bundle.main.loadNibNamed("StatsCell", owner: self, options: nil)?.first as! StatsCell
            cell.statsImg.image = arrayOfCellData[indexPath.row].image
            cell.statsLabel.text = arrayOfCellData[indexPath.row].text*/ //when u use xib files
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if arrayOfCellData[indexPath.row].cell == 1 {
            let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "playCell")
            
                performSegue(withIdentifier: "play", sender: cell)
        } else if arrayOfCellData[indexPath.row].cell == 3 {
            let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "settingCell")
            
            performSegue(withIdentifier: "settings", sender: cell)
        } else {
            let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "statsCell")
            
            performSegue(withIdentifier: "stats", sender: cell)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCellData.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        /*if arrayOfCellData[indexPath.row].cell == 1 {
            return CGFloat(128)
        } else if arrayOfCellData[indexPath.row].cell == 3 {
            return CGFloat(88)
        } else {
            return CGFloat(88)
        }*/
        return CGFloat(100)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "play":
            _ = segue.destination as! GameViewController
            
        case "stats":
            _ = segue.destination as! StatsViewController
            
        case "settings":
            _ = segue.destination as! SettingViewController
            
        case "info":
            _ = segue.destination as! HelpViewController

            
        default:
            break
        }
    }
    
    @IBAction func exitNow(sender: AnyObject) {
        exit(0)
    }
}
