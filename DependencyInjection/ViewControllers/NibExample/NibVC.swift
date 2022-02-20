//
//  NibVC.swift
//  DependencyInjection
//
//  Created by Ferhan Akkan on 20.02.2022.
//

import UIKit

final class NibVC: UIViewController {

    @IBOutlet weak var injectedLabel: UILabel!

    private let injectedString: String

    convenience init(injectedString: String) {
        self.injectedString = injectedString

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        self.injectedString = "coder"
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        injectedLabel.text = injectedString
    }
}
