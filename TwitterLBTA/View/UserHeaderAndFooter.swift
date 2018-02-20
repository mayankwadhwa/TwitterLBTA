//
//  Cells.swift
//  TwitterLBTA
//
//  Created by Mayank  Wadhwa on 18/02/18.
//  Copyright © 2018 ShinobiTech. All rights reserved.
//

import LBTAComponents

let twitterBlue = UIColor(r: 61, g: 167, b: 244)

class UserHeader: DatasourceCell{
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "WHO TO FOLLOW"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        
        addSubview(textLabel)
        textLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
}

class UserFooter: DatasourceCell{
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Show me more"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = twitterBlue
        return label
    }()

    
    override func setupViews() {
        addSubview(textLabel)
        
        textLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}

class UserCell: DatasourceCell {
// Every DatasourceCell has access to the datasource item
    override var datasourceItem: Any? {
        didSet {
// Downcast the datasourceItem as User if not then do nothing
            guard let user = datasourceItem as? User else { return }
            nameLabel.text = user.name
            userNameLabel.text = user.username
            bioTextView.text = user.bioText
            profileImageView.image = user.profileImage
        }
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.image = #imageLiteral(resourceName: "twitter-Pic")
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Mayank Wadhwa"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        return label
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "@mayankwadhwa19"
        label.textColor = UIColor(r: 130, g: 130, b: 130)
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Hello i am an pretty fucking average guy who is lazy, insecure and uncompetitive but still thinks can take over the world. what the fuck right......!"
        textView.font = UIFont.systemFont(ofSize: 15)
//        Textview has white background by default 
        textView.backgroundColor = .clear
        return textView
    }()
    
    let followButton: UIButton = {
        let button = UIButton()
        let twitterBlue = UIColor(r: 61, g: 167, b: 244)
        button.layer.cornerRadius = 5
        button.layer.borderColor = twitterBlue.cgColor
        button.layer.borderWidth = 1
        button.setTitle("Follow", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(twitterBlue, for: .normal)
        button.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        
        
        
        return button
    }()
    
    override func setupViews() {
        super.setupViews()

        separatorLineView.isHidden = false
        separatorLineView.backgroundColor = UIColor(r: 230, g: 230, b: 230)

        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(userNameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        

        profileImageView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        
        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8,bottomConstant: 0, rightConstant: 12, widthConstant: 0,
                         heightConstant: 20)
        
        userNameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)
        
        bioTextView.anchor(userNameLabel.bottomAnchor, left: userNameLabel.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -4, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        followButton.anchor(self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, topConstant:12, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
        
    }
}
