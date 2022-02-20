//
//  HomeVC.swift
//  DependencyInjection
//
//  Created by Ferhan Akkan on 20.02.2022.
//

import UIKit

enum HomeVCItem {
    case storyboardExampleWithSegue
    case storyboardExampleWithStoryboardId
    case nibExampleWithCustomInitilizer
    case nibExampleWithCoderInitilizer
    case programmaticExample

    var title: String {
        switch self {
        case .nibExampleWithCustomInitilizer:  return "Nib Example With Custom Initilizer"
        case .nibExampleWithCoderInitilizer: return "Nib Example With Coder Initlizer"
        case .storyboardExampleWithSegue: return "Storyboard Example With Segue"
        case .storyboardExampleWithStoryboardId: return "Storyboard Example With Storyboard Id"
        case .programmaticExample: return "Programmatic Example"
        }
    }
}

final class HomeVC: UIViewController {

    let datas: [HomeVCItem] = [
        .storyboardExampleWithSegue,
        .storyboardExampleWithStoryboardId,
        .nibExampleWithCustomInitilizer,
        .nibExampleWithCoderInitilizer,
        .programmaticExample
    ]

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
    }
}

private extension HomeVC {

    func configure() {
        layout()
        setDelegate()
        tableView.reloadData()
    }

    func layout() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])

        view.backgroundColor = .white
    }

    func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension HomeVC: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        switch datas[indexPath.row] {
        case .storyboardExampleWithSegue: break

        case .storyboardExampleWithStoryboardId: break

        case .nibExampleWithCustomInitilizer:
            let vc = NibVC(injectedString: "Hi developer Its Nib Screen With Custom initilizer")
            self.show(vc, sender: nil)

        case .nibExampleWithCoderInitilizer:
            //BUG!!!
//            if let vc = Bundle.main.loadNibNamed("NibVC", owner: self, options: nil)?.first as? NibVC {
//                self.show(vc, sender: nil)
//            }
            break

        case .programmaticExample:
            let vc = ProgrammaticExampleVC(injectedTitle: "Hi developer Its Programmatic Screen")
            self.show(vc, sender: nil)
        }
    }
}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = datas[indexPath.row].title
        return cell
    }
}
