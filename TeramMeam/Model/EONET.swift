//
//  EONET.swift
//  TeramMeam
//
//  Created by Nazar Petruk on 04/02/2020.
//  Copyright © 2020 Nazar Petruk. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class EONET {
  static let API = "https://eonet.sci.gsfc.nasa.gov/api/v2.1"
  static let categoriesEndpoint = "/categories"
  static let eventsEndpoint = "/events"

  static var ISODateReader: DateFormatter = {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZ"
    return formatter
  }()

  static func filteredEvents(events: [EOEvent], forCategory category: EOCategory) -> [EOEvent] {
    return events.filter { event in
      return event.categories.contains(category.id) &&
             !category.events.contains {
               $0.id == event.id
             }
    }
    .sorted(by: EOEvent.compareDates)
  }
    
    static func request(endpoint : String, query : [String : Any] = [:]) -> Observable<[String : Any]> {
        do {
            guard let url = URL(string: API)?.appendingPathComponent(endpoint),
                var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
                    throw EOError.invalidURL(endpoint)
            }
            components.queryItems = try query.compactMap {
                (key , value) in
                guard let v = value as? CustomStringConvertible else {
                    throw EOError.invalidParameter(key, value)
                }
                return URLQueryItem(name: key, value: v.description)
            }
            guard let finalURL = components.url else{
                throw EOError.invalidURL(endpoint)
            }
            let request = URLRequest(url: finalURL)
            return URLSession.shared.rx.response(request: request).map {
                _, data -> [String : Any] in
                guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []),
                    let result = jsonObject as? [String : Any] else {
                        throw EOError.invalidJSON(finalURL.absoluteURL)
                }
                return result
            }
        }catch{
            return Observable.empty()
        }
    }
  
}
