//
//  ViewController.swift
//  ContainerViewEx
//
//  Created by 김종권 on 2021/09/09.
//

import UIKit

class ViewController: UIViewController {

    lazy var containerView: UIView = {
        let view = UIView()

        return view
    }()

    lazy var contentTableView: MyTableViewController = {
        let view = MyTableViewController()

        return view
    }()

    lazy var removeButton: UIButton = {
        let button = UIButton()
        button.setTitle("contents 삭제", for: .normal)
        button.addTarget(self, action: #selector(removeContentsView), for: .touchUpInside)
        button.backgroundColor = .orange
        button.transform = .init(scaleX: 1.1, y: 1.1)

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .brown.withAlphaComponent(0.999)

        view.addSubview(containerView)
        view.addSubview(removeButton)

        containerView.translatesAutoresizingMaskIntoConstraints = false
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -36),
            containerView.heightAnchor.constraint(equalToConstant: 300),

            removeButton.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 16),
            removeButton.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        ])

        addContentsView()
    }

    private func addContentsView() {
        addChild(contentTableView)
        contentTableView.view.frame = containerView.frame
        containerView.addSubview(contentTableView.view)
        contentTableView.didMove(toParent: self)
    }

    @objc
    private func removeContentsView() {
        contentTableView.willMove(toParent: nil)
        contentTableView.removeFromParent()
        contentTableView.view.removeFromSuperview()

        animateTapGesture()
    }

    private func animateTapGesture() {
        UIView.animate(withDuration: 0.05) {
            self.removeButton.transform = .identity
        } completion: { _ in
            self.removeButton.transform = .init(scaleX: 1.1, y: 1.1)
        }

    }

}

