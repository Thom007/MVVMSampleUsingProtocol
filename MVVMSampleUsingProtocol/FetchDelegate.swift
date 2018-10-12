//
//  FetchDelegate.swift
//  MVVMSampleUsingProtocol
//
//  Created by for Work on 5/31/2561 BE.
//  Copyright © 2561 for Work. All rights reserved.
//

import Foundation

protocol FetchDelegate: class {
    func presentList(info: [ArticleModel]? )
}
