//
//  Protocols .swift
//  instagramClone
//
//  Created by Levit Kanner on 21/09/2019.
//  Copyright © 2019 Levit Kanner. All rights reserved.
//

import Foundation

protocol userProfileHeaderDelegate {
    func configureEditFollowButton (for header: profileHeader)
    func setUserStats (for header : profileHeader)
    func handleEditButtonTapped (for header : profileHeader)
    func handleFollowersTapped (for header : profileHeader)
    func handleFollowingTapped (for header : profileHeader)
}

protocol followerCellDelegate {
    func handleFollowButtonTapped(for cell : FollowerCell)
}

protocol SelectImageDelegate {
    func handleCancel()
    func handleNext()
}

protocol  UploadImageDelegate {
    func handleUpload()
}
