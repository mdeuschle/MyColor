//
//  ViewController.swift
//  MyColors
//
//  Created by Matt Deuschle on 6/30/19.
//  Copyright © 2019 Matt Deuschle. All rights reserved.
//

import UIKit

final class ViewController: UITableViewController {
    
    private var colors = [Color]()

    override func viewDidLoad() {
        super.viewDidLoad()
        downloadColors()
        tableView.register(ColorCell.self, forCellReuseIdentifier: "ColorCell")
    }
    
    private func downloadColors() {
        ColorStore.shared.downloadColors { [weak self] result in
            switch result {
            case .success(let colors):
                self?.colors = colors.sorted { $0.rank ?? 0 < $1.rank ?? 0 }
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath) as? ColorCell else {
            return ColorCell()
        }
        let color = colors[indexPath.row]
        cell.configure(with: color)
        return cell
    }
}

