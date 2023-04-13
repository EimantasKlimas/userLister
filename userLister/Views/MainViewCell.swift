import UIKit

public final class MainViewCell: UITableViewCell {
    
    private lazy var userIcon: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "defaultUser")
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        view.layer.cornerRadius = 20
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(10)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textColor = .lightGray
        
        return label
    }()
    
    private lazy var bodyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font.withSize(6)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textColor = .white
        
        return label
    }()
    
    public func setup(with post: Post) {
        setupView()
        setupUserIcon()

        setupLabels(with: post.title, and: post.body)
    }
}

private extension MainViewCell {
    func setupView() {
        contentView.addSubview(containerView)
        contentView.backgroundColor = .clear
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    func setupLabels(with title: String, and body: String) {
        containerView.addSubview(titleLabel)
        containerView.addSubview(bodyLabel)
        
        titleLabel.text = title
        bodyLabel.text = body
        
        titleLabel.sizeToFit()
        bodyLabel.sizeToFit()
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: userIcon.trailingAnchor, constant: 5),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 5),
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            bodyLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            bodyLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            bodyLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        ])
    }
    
    func setupUserIcon() {
        containerView.addSubview(userIcon)
        
        NSLayoutConstraint.activate([
            userIcon.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            userIcon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            userIcon.heightAnchor.constraint(equalToConstant: 80),
            userIcon.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
}
