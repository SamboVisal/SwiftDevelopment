//
//  DashboardBannerViewModel.swift
//  vKclub Version 2
//
//  Created by Pisal on 6/26/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import Foundation

class BannerCellImage: NSObject {
    
    var dataBanner: [DataBanner]?
    
    static func getBannerImage() -> [BannerCellImage]{
        
        let bannerSection = BannerCellImage()
        let bannerData = DataBanner()
        var bannerDataAppend = [DataBanner]()
        bannerData.imageBannerName = "pineresort"
        bannerData.titleEachBanner = "Welcome to vKirirom"
        bannerData.detailEachBanner = "Enjoy Kirirom"
        bannerDataAppend.append(bannerData)
        
        
        let dataBanner2 = DataBanner()
        dataBanner2.imageBannerName = "pipe"
        dataBanner2.titleEachBanner = "Best natural place"
        dataBanner2.detailEachBanner = "Caught fresh air"
        bannerDataAppend.append(dataBanner2)
        
        let dataBanner3 = DataBanner()
        dataBanner3.imageBannerName = "luxurytent"
        dataBanner3.titleEachBanner = "Cool environment"
        dataBanner3.detailEachBanner = "This is your second house"
        bannerDataAppend.append(dataBanner3)
        
        
        let dataBanner4 = DataBanner()
        dataBanner4.imageBannerName = "khmercottage"
        dataBanner4.titleEachBanner = "Khmer Cottage"
        dataBanner4.detailEachBanner = "Enjoy with khmer traditional house"
        bannerDataAppend.append(dataBanner4)
        
        let dataBanner5 = DataBanner()
        dataBanner5.imageBannerName = "bungalow"
        dataBanner5.titleEachBanner = "Bungalow Room"
        dataBanner5.detailEachBanner = "Comfortable with your love."
        bannerDataAppend.append(dataBanner5)
        
        bannerSection.dataBanner = bannerDataAppend
        print(bannerDataAppend.count)
        return [bannerSection]
    }
    
}
class DataBanner: NSObject {
    
    var imageBannerName: String?
    var urlEachBannerImage: String?
    var titleEachBanner: String?
    var detailEachBanner: String?
}
