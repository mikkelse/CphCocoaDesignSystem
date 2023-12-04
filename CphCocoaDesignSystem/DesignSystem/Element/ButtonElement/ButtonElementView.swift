//
//  ButtonElementView.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 02/12/2023.
//

import UIKit
import Combine

class ButtonElementView: UIView {
    
    private var subscriptions = Set<AnyCancellable>()
    
    private var orientationConstraints: [NSLayoutConstraint] = []
    private let button = UIButton(frame: .zero)
    
    private let action: () -> Void
    
    init(_ button: Button) {
        self.action = button.action
        super.init(frame: .zero)
        setup(with: button)
    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { fatalError() }
    
    private func setup(with buttonElement: Button) {
        
        let title = TextStyle.button.attributedString(buttonElement.title)
        
        button.setAttributedTitle(title, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.layer.borderWidth = .Sizing.borderWidth
        button.layer.borderColor = UIColor.border.cgColor
        button.layer.cornerRadius = .Sizing.buttonCornerRadius
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.heightAnchor.constraint(equalToConstant: .Sizing.defaultElementHeight),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        buttonElement.$isEnabled
            .sink { [unowned self] isEnabled in
                self.button.isEnabled = isEnabled
                self.button.layer.borderColor = if isEnabled { UIColor.border.cgColor } else { UIColor.disabled.cgColor }
                self.button.titleLabel?.textColor = if isEnabled { .content } else { .disabled }
            }
            .store(in: &subscriptions)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(orientationDidChange),
                                               name: UIDevice.orientationDidChangeNotification,
                                               object: nil)
        
        updateLayout(for: UIDevice.current.orientation)
    }
    
    @objc
    private func buttonPressed() {
        action()
    }
    
    @objc
    private func orientationDidChange(_ notification: Notification) {
        guard let device = notification.object as? UIDevice else { return }
        updateLayout(for: device.orientation)
    }
    
    private func updateLayout(for orientation: UIDeviceOrientation) {
        
        NSLayoutConstraint.deactivate(orientationConstraints)
        
        if orientation.isLandscape {
            orientationConstraints = [
                button.leadingAnchor.constraint(equalTo: centerXAnchor),
                button.trailingAnchor.constraint(equalTo: trailingAnchor)
            ]
        } else {
            orientationConstraints = [
                button.leadingAnchor.constraint(equalTo: leadingAnchor),
                button.trailingAnchor.constraint(equalTo: trailingAnchor)
            ]
        }
        
        NSLayoutConstraint.activate(orientationConstraints)
    }
}
