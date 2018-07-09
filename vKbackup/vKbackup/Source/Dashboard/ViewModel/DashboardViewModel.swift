//
//  DashboardViewModel.swift
//  vKclub Version 2
//
//  Created by Pisal on 6/25/2561 BE.
//  Copyright © 2561 BE Pisal. All rights reserved.
//

import Foundation

class CellCategory: NSObject {
    
    private struct Constant {
        static let recommendationSectionName = "Recommendation"
        static let recentSectionName = "Recent"
    }
  
    var sectionName: String?
    var data: [DataSection]?
    
    static func nameSectionCategory() -> [CellCategory]{
        
        let recommendationCategory = CellCategory()
        
        recommendationCategory.sectionName = Constant.recommendationSectionName
        var recommendDataAppend = [DataSection]()
        let sectionData = DataSection()
        sectionData.imageName = "Rec1"
        sectionData.titleImage = "Activity"
        sectionData.descImage = "Play to win prize."
        recommendDataAppend.append(sectionData)
        
        
        let data3Section = DataSection()
        data3Section.imageName = "Rec2"
        data3Section.titleImage = "Tunnel Room"
        data3Section.descImage = "Best choice"
        recommendDataAppend.append(data3Section)
        
        let sectionDataRec = DataSection()
        sectionDataRec.imageName = "Rec3"
        sectionDataRec.titleImage = "Other game"
        sectionDataRec.descImage = "Invite your friends"
        recommendDataAppend.append(sectionDataRec)
        
        let sectionDataRec2 = DataSection()
        sectionDataRec2.imageName = "Rec4"
        sectionDataRec2.titleImage = "Best game"
        sectionDataRec2.descImage = "Team work"
        recommendDataAppend.append(sectionDataRec2)
        recommendationCategory.data = recommendDataAppend
        
        let recentCategory = CellCategory()
        recentCategory.sectionName = Constant.recentSectionName
        
        var recentDataAppend = [DataSection]()
        
        let sectionData2 = DataSection()
        sectionData2.imageName = "Re1"
        sectionData2.titleImage =  "Bubble"
        sectionData2.descImage = "Fight your friends"
        recentDataAppend.append(sectionData2)
        
        let sectionDataRe2 = DataSection()
        sectionDataRe2.imageName = "Re2"
        sectionDataRe2.titleImage = "Other game"
        sectionDataRe2.descImage = "Improve team work"
        recentDataAppend.append(sectionDataRe2)
        
        let sectionDataRe3 = DataSection()
        sectionDataRe3.imageName = "Re3"
        sectionDataRe3.titleImage = "Feeling bored?"
        sectionDataRe3.descImage = "Let's cow be your vehicle"

        recentDataAppend.append(sectionDataRe3)
        
        let sectionDataRe4 = DataSection()
        sectionDataRe4.imageName = "Re4"
        sectionDataRe4.titleImage = "Other bubble game"
        sectionDataRe4.descImage = "Football"
        recentDataAppend.append(sectionDataRe4)
        
        
        recentCategory.data = recentDataAppend
        return [recommendationCategory, recentCategory]
        
    }
    
}
class DataSection: NSObject {
    var imageName: String?
    var urlEachImage: String?
    var titleImage: String?
    var descImage: String?
}
class BannerSection: NSObject {
    var bannerImageName: String?
}
