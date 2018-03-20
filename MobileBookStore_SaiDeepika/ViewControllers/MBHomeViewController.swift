//
//  MBHomeViewController.swift
//  MobileBookStore_SaiDeepika
//
//  Created by Minnie . on 3/20/18.
//  Copyright © 2018 sample. All rights reserved.
//

import UIKit

class MBHomeViewController: UIViewController {
    //MARK: - Properties
    
    @IBOutlet weak var bookListTableView: UITableView!
    var booksArray = [MBBookModel] ()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = MBConstants.ScreenTitles.MainScreenTitle
        
        bookListTableView.register(UINib.init(nibName: MBConstants.NibNames.BookTableViewNib, bundle: nil), forCellReuseIdentifier: MBConstants.CellIdentifiers.BookTableViewCellIdentifier)
        
       //Fetching data using service call
        MBServiceManager.shared.downloadDataFromURL(url: URL(string: MBConstants.ServiceUrls.MainUrl)!) { booksData in
            self.booksArray = booksData
            DispatchQueue.main.async {
                //reload the table
                self.bookListTableView.reloadData()
                
            }
    }
}
}

    extension MBHomeViewController:UITableViewDataSource,UITableViewDelegate{
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.booksArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: MBConstants.CellIdentifiers.BookTableViewCellIdentifier, for: indexPath) as! MBBookTableViewCell
            let individualBookDetails = self.booksArray[indexPath.row]
            
            cell.bookTitle.text = individualBookDetails.title ?? ""
            
            if let authorName = individualBookDetails.author{
                cell.bookAuthor.text = MBConstants.HelperTexts.ByText + authorName
            }else{
                cell.bookAuthor.text = ""
            }
            
            
            if let imageUrl = individualBookDetails.bookImageUrl{
                MBServiceManager.shared.downloadImageFromURL(url: imageUrl) { downloadedImage in
                    DispatchQueue.main.async {
                        cell.bookImageView.image = downloadedImage
                    }
                }
            }
            
            return cell
        }
        //Establishing push segue to the book detail view controller
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let bookModel = self.booksArray[indexPath.row]
            let storyBoard : UIStoryboard = UIStoryboard(name: MBConstants.StoryboardIdentifiers.MainStoryboardIdentifier, bundle:nil)
            let bookDetailsViewController = storyBoard.instantiateViewController(withIdentifier: MBConstants.StoryboardIdentifiers.MBDetailViewControllerIdentifier) as! MBDetailViewController
            bookDetailsViewController.bookModel = bookModel
            self.navigationController?.pushViewController(bookDetailsViewController, animated: true)
            
        }
        
}
