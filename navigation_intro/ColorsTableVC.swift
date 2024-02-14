//
//  ColorsTableVC.swift
//  navigation_intro
//
//  Created by Shaxobiddin on 23/01/24.
//

import UIKit

class ColorsTableVC: UIViewController {
    
    var colors: [UIColor] = []
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createRandomColors()
    }
    
    func createRandomColors() {
        for _ in 0...50 {
            colors.append(.randomColor())
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ColorsDetailVC
        destVC.color = sender as? UIColor
    }
    
}

enum Cells {
    static let colorCell = "ColorCell"
}

enum Segues {
    static let toDetail = "ToColorsDetailVC"
}

extension ColorsTableVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cells.colorCell) else {
            return UITableViewCell()
        }
        cell.textLabel?.text = colors[indexPath.row].accessibilityName.capitalized
        cell.backgroundColor = colors[indexPath.row]
    
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Segues.toDetail, sender: colors[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [deleteItem(forRowAt: indexPath)])
    }
    
    func deleteItem(forRowAt indexPath: IndexPath) -> UIContextualAction {
        return UIContextualAction(style: .destructive, title: "Delete") { action, swipeButtonView, complation in
            complation(true)
            self.colors.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
    }
}
