//
//  TuneCell.swift
//  halfTune
//
//  Created by Гурген on 05.08.2021.
//

import UIKit

class TuneCell: UITableViewCell {
    
    static let reuseID = "TuneCell"
    
    var viewModel: TuneCellViewModel?
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.text = "Title"
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var artistLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.text = "Artist"
        label.isEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        contentView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14).isActive = true
        
        contentView.addSubview(artistLabel)
        artistLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 1).isActive = true
        artistLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14).isActive = true
        artistLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
    
    func configureUI() {
        guard let track = viewModel?.track else { return }
        
        titleLabel.text = track.trackName
        artistLabel.text = track.artistName
    }
}

