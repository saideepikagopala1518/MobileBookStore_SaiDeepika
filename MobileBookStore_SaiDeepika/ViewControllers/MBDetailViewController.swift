//
//  MBDetailViewController.swift
//  MobileBookStore_SaiDeepika
//
//  Created by Minnie . on 3/20/18.
//  Copyright © 2018 sample. All rights reserved.
//

import UIKit

class MBDetailViewController: UIViewController {
    //MARK: - Properties
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthorName: UILabel!
    @IBOutlet weak var bookImageView: UIImageView!
    var bookModel:MBBookModel?
    
    // MARK: - View Lifecycle
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = MBConstants.ScreenTitles.DetailScreenTitle
        configureDetailsView()
        
    }
    // MARK: - configureDetailsView
    // MARK: -
    func configureDetailsView() {
        //Set book title
        if let title = bookModel?.title {
            bookTitle.text = title
        }
        
        if let authorName = bookModel?.author{
            bookAuthorName.text = MBConstants.HelperTexts.ByText + authorName
        }else{
            bookAuthorName.text = ""
        }
        
        if let imageUrl = bookModel?.bookImageUrl{
            MBServiceManager.shared.downloadImageFromURL(url: imageUrl) { downloadedImage in
                DispatchQueue.main.async {
                    self.bookImageView.image = downloadedImage
                }
            }
        }
    }
    



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
