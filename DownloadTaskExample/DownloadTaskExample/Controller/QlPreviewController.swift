//
//  QlPreviewController.swift
//  DownloadTaskExample
//
//  Created by Pisal on 5/24/2561 BE.
//  Copyright © 2561 BE Example. All rights reserved.
//

import UIKit
import QuickLook

class QlPreviewController: UIViewController , QLPreviewControllerDataSource,QLPreviewControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        let preview = QLPreviewController()
        preview.dataSource = self
        self.present(preview, animated: true) {
            print("Open QLPREVIEW")
        }

        // Do any additional setup after loading the view.
    }
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, shouldOpen url: URL, for item: QLPreviewItem) -> Bool {
        print("URL OPENING: \(url) and for item: \(item)")
        return true
    }
    func previewControllerWillDismiss(_ controller: QLPreviewController) {
        try! FileManager.default.removeItem(at: locationDownload)
    }
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        print("Location downloaded \(locationDownload)")
        return locationDownload as QLPreviewItem
    }

}
