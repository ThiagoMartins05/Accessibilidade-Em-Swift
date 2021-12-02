//
//  HomeTableViewCell.swift
//  accessibility-ios
//
//  Created by Thiago Martins on 25/11/21.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    private enum Constants: CGFloat {
        case margin = 16
    }
    
    let identifier = "HomeTableViewCell"

    private lazy var profileImage = makeImageView()
    
    private lazy var ageTitleLabel = makeLabel(with: "Idade: ")
    let ageLabel = UILabel()
    private lazy var ageStackView = makeHorizontalStackView()
    
    private lazy var favoriteColorTitleLabel = makeLabel(with: "Cor favorita: ")
    let favoriteColorLabel = UILabel()
    private lazy var favoriteColorStackView = makeHorizontalStackView()
    
    private lazy var nameTitleLabel = makeLabel(with: "Nome: ")
    let nameLabel = UILabel()
    private lazy var nameStackView = makeHorizontalStackView()

    func makeImageView() -> UIImageView {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }
    
    func makeHorizontalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    
    func makeLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(profileImage)
        addSubview(nameStackView)
        addSubview(ageStackView)
        addSubview(favoriteColorStackView)
        
        nameStackView.addArrangedSubview(nameTitleLabel)
        nameStackView.addArrangedSubview(nameLabel)
        
        ageStackView.addArrangedSubview(ageTitleLabel)
        ageStackView.addArrangedSubview(ageLabel)
        
        favoriteColorStackView.addArrangedSubview(favoriteColorTitleLabel)
        favoriteColorStackView.addArrangedSubview(favoriteColorLabel)
    }
    
    private func addConstraints() {
        ageLabel.translatesAutoresizingMaskIntoConstraints = false
        favoriteColorLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        
        // Profile image
        NSLayoutConstraint.activate([
            profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Constants.margin.rawValue),
            profileImage.trailingAnchor.constraint(equalTo: nameStackView.leadingAnchor, constant: -Constants.margin.rawValue),
            profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.margin.rawValue),
            profileImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.margin.rawValue),
            profileImage.widthAnchor.constraint(equalToConstant: 60),
            profileImage.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        profileImage.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        // Name StackView
        NSLayoutConstraint.activate([
            nameStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: Constants.margin.rawValue),
            nameStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.margin.rawValue),
            nameStackView.bottomAnchor.constraint(equalTo: ageStackView.topAnchor, constant: Constants.margin.rawValue),
        ])
        
        // age StackView
        NSLayoutConstraint.activate([
            ageStackView.leadingAnchor.constraint(equalTo: nameStackView.leadingAnchor),
            ageStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.margin.rawValue),
            ageStackView.bottomAnchor.constraint(equalTo: favoriteColorStackView.topAnchor, constant: -Constants.margin.rawValue),
        ])
        
        // favorite food image
        NSLayoutConstraint.activate([
            favoriteColorStackView.leadingAnchor.constraint(equalTo: nameStackView.leadingAnchor),
            favoriteColorStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Constants.margin.rawValue),
            favoriteColorStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Constants.margin.rawValue),
        ])
    }
    
    func setup(with character: Character) {
        nameLabel.text = character.name
        ageLabel.text = character.age
        favoriteColorLabel.text = character.favoriteColor
        profileImage.image = UIImage(named: character.name)
    }

}
