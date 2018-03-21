//
//  ProductLine.swift
//  vKdemo
//
//  Created by Pisal on 3/19/18.
//  Copyright © 2018 Pisal. All rights reserved.
//

import UIKit
class ProductLine{
    var name: String
    var products: [Product]
    init(named: String, inculeProduct: [Product]) {
        name = named
        products = inculeProduct
    }
    class func getProductLine() -> [ProductLine]{
        return [accomdationSec(),activitySec(),propertySec()]
    }
    // Mark: Private Helper Class
    private class func accomdationSec() -> ProductLine{
        var product = [Product]()
        product.append(Product(titled:"Villa Suite",description:"This two-bedroom villa with a mezzaine level is suitable for bigger families or group. This mordern wide living room and an open roof deck for BBQ party.",imageName: "TypeV"))
        product.append(Product(titled:"Villa Jasmine",description:"This two-bedroom villa with a mezzaine level is suitable for bigger families or group. This mordern wide living room and an open roof deck for BBQ party.",imageName: "TypeV"))
        return ProductLine(named:"Accomdation",inculeProduct: product)
    }
    private class func activitySec() -> ProductLine{
        var product = [Product]()
        product.append(Product(titled: "Pine Restaurant",description:"Serves the best foods with our experienced chefs among all the pine trees.",imageName: "TypeV"))
        product.append(Product(titled: "Message",description:"Serves the best foods with our experienced chefs among all the pine trees.",imageName: "TypeV"))
        return ProductLine(named:"Activity",inculeProduct: product)
    }
    private class func propertySec() -> ProductLine{
        var product = [Product]()
        product.append(Product(titled: "TypeA2",description:"Serves the best foods with our experienced chefs among all the pine trees.",imageName: "TypeV"))
        product.append(Product(titled: "TypeA3",description:"Serves the best foods with our experienced chefs among all the pine trees.",imageName: "TypeV"))
        return ProductLine(named:"Property",inculeProduct: product)
    }
    
}
