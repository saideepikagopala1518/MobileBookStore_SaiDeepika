//
//  MBConstants.swift
//  MobileBookStore_SaiDeepika
//
//  Created by Minnie . on 3/20/18.
//  Copyright © 2018 sample. All rights reserved.
//

import Foundation

class MBConstants{
    
    //screen titles
    struct ScreenTitles {
        static let MainScreenTitle = "Books List"
        static let DetailScreenTitle = "Book Details"
    }
    
    //URL details
    struct ServiceUrls {
        static let MainUrl = "http://de-coding-test.s3.amazonaws.com/books.json"
    }
    
    //table reusable identifier
    struct CellIdentifiers {
        static let BookTableViewCellIdentifier = "bookCellIdentifier"
    }
    
    //NIB details
    struct NibNames {
        static let BookTableViewNib = "MBBookTableViewCell"
    }
    
    //StoryboardIdentifiers
    struct StoryboardIdentifiers {
        static let MainStoryboardIdentifier = "Main"
        static let MBDetailViewControllerIdentifier = "MBDetailViewController"
    }
    
    //HelperTexts
    struct HelperTexts {
        static let ByText = "by "
    }
}
