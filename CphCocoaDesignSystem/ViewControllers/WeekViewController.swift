//
//  WeekViewController.swift
//  CphCocoaDesignSystem
//
//  Created by Mikkel Sindberg Eriksen on 03/12/2023.
//

import UIKit
import Combine

class WeekViewController: ScrollingContentViewController {
    
    init(data: [WeatherDay], completion: @escaping (WeatherDay) -> Void) {
        
        var sections = [Section]()
        
        let topSection = Section {
            Icon(.list)
        }
        sections.append(topSection)
        
        data.forEach { day in
            let section = Section {
                let dayView = DayView(day) { completion(day) }
                Custom(view: dayView)
            }
            sections.append(section)
        }
    
        super.init(topContent: Content(sections: sections))
    }
}

// MARK: - Custom Day View

private class DayView: UIView {
    
    private let selectionHandler: () -> Void
    
    init(_ day: WeatherDay, selectionHandler: @escaping () -> Void) {
        self.selectionHandler = selectionHandler
        super.init(frame: .zero)
        setup(with: day)
    }
    
    private func setup(with day: WeatherDay) {
        
        translatesAutoresizingMaskIntoConstraints = false

        let textView = Text(.title, day.title).createView()
        textView.setContentCompressionResistancePriority(.required, for: .horizontal)
        
        let imageView = UIImageView(image: day.icon.image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .content
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        
        stackView.addArrangedSubview(textView)
        stackView.addArrangedSubview(imageView)
        
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        addGestureRecognizer(tap)

    }
    
    @available(*, unavailable) required init?(coder: NSCoder) { fatalError() }
    
    @objc
    private func viewTapped() {
        selectionHandler()
    }
}
