//
//  MBServiceManager.swift
//  MobileBookStore_SaiDeepika
//
//  Created by Minnie . on 3/20/18.
//  Copyright © 2018 sample. All rights reserved.
//

import Foundation
import UIKit

class MBServiceManager{
    //Shared instance
    static let shared = MBServiceManager()
    
    typealias DownloadedDataCompletionHandler = ([MBBookModel]) -> ()
    typealias DownloadedImageCompletionHandler = (UIImage) -> ()
    let imageCache = NSCache<NSString, UIImage>()
    
    // MARK: - downloadImageFromURL
    // MARK: -
    func downloadImageFromURL(url:String ,completionHandler: @escaping DownloadedImageCompletionHandler) {
        
        if let particularBookImage = self.imageCache.object(forKey: url as NSString){
            completionHandler(particularBookImage)
            
        } else {
            //fetching data
            URLSession.shared.dataTask( with: URL(string:url)!, completionHandler: {
                (data, response, error) -> Void in
                DispatchQueue.main.async {
                    //asynchronous call
                    if let downloadedImage:UIImage = UIImage(data: data!){
                        self.imageCache.setObject(downloadedImage, forKey: url as NSString)
                        completionHandler(downloadedImage)
                    }
                }
            }).resume()
        }
        
    }
    
    // MARK: - downloadDataFromURL
    // MARK: -
    func downloadDataFromURL(url: URL,completionHandler: @escaping DownloadedDataCompletionHandler) {
        //The array of dictionaries from the json
        var bookDetailsArray = [MBBookModel]()
        
        //Creating request
        let request = NSMutableURLRequest(url:url)
        
        //Creating session object
        let task = URLSession.shared.dataTask(with: request as URLRequest) {(data, response, error) in
            
            guard error == nil else {
                return
            }
            
            guard let content = data else {
                return
            }
            //Fetching data into array
            guard let json  = try? JSONSerialization.jsonObject(with: content, options: []) else {
                return
            }
            
            let bookDetailsJson = json as? [[String:String]]
            //accessing individual book details
            for individualBook in bookDetailsJson!{
                
                let bookModel = MBBookModel(bookDict: individualBook)
                bookDetailsArray.append(bookModel)
            }
            completionHandler(bookDetailsArray)
        }
        task.resume()
    
    }
}
