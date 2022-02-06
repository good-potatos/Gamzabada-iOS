//
//  BaseEffect.swift
//  
//
//  Created by Wimes on 2022/02/05.
//

import ComposableArchitecture
import Combine

public class BaseEffect{
    let session = URLSession.shared
    
    public func execute<T: Decodable>(api: GamzabadaApi) -> Effect<T, ApiError>{
        self.session
            .dataTaskPublisher(for: api.request)
            .tryMap{ output -> Data in
                guard let statusCode = (output.response as? HTTPURLResponse)?.statusCode else{
                    throw ApiError.unknown
                }
                
                if statusCode >= 200 && statusCode < 300{
                    return output.data
                }else{
                    throw ApiError.badRequest(body: output.data.dictionary)
                }
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError{ error -> ApiError in
                switch error{
                case is URLError:
                    return .network
                case is DecodingError:
                    return .parsing
                default:
                    return error as? ApiError ?? .unknown
                }
            }
            .eraseToEffect()
    }
}
