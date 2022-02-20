//
//  ProgrammaticExampleVC.swift
//  DependencyInjection
//
//  Created by Ferhan Akkan on 20.02.2022.
//

import UIKit

final class ProgrammaticExampleVC: UIViewController {

    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        return label
    }()

    init(injectedTitle: String) {
        super.init(nibName: nil, bundle: nil)

        view.backgroundColor = .white

        label.text = injectedTitle //We use injectedTitle to set out label.
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
