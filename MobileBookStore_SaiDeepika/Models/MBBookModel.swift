//
//  MBBookModel.swift
//  MobileBookStore_SaiDeepika
//
//  Created by Minnie . on 3/20/18.
//  Copyright © 2018 sample. All rights reserved.
//

import Foundation

class MBBookModel{
    private(set) public var title:String?
    private(set) public var bookImageUrl:String?
    private(set) public var author:String?
    
    init(bookDict:[String:String]) {
        
        if let title = bookDict["title"]{
            self.title = title
        }
        
        if let imageUrl = bookDict["imageURL"]{
            self.bookImageUrl = imageUrl
        }
        
        if let authorName = bookDict["author"]{
            self.author = authorName
        }
    }
}
