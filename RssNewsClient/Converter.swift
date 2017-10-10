//
//  Converter.swift
//  RssNewsClient
//
//  Created by Nikolay on 10.10.17.
//  Copyright © 2017 Eugene Lezov. All rights reserved.
//

import Foundation

func dateToString(_ date: Date) -> String {
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = "MM/dd/yy h:mm a Z"
    let stringDate = dateformatter.string(from: date)
    return stringDate
}
