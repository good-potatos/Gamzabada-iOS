//
//  UrlRequestBuilder.swift
//  
//
//  Created by Wimes on 2022/02/05.
//

import Foundation

struct UrlRequestBuilder{
    var object: GamzabadaApi
    
    var urlRequest: URLRequest{
        
        
        var request = URLRequest(url: self.object.url)
        
        self.object.header.forEach{
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        if let requestBody = self.object.requestBody {
            request.httpBody = requestBody
        }
        print("### url: ", self.object.url)
        print("### header: ", self.object.header)
        print("### body: ", self.object.requestBody?.dictionary ?? "nil")
        return request
    }
}
