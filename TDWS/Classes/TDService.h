//
//  TDService.h
//  GC
//
//  Created by sa vincent on 3/20/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFAppDotNetAPIClient;

extern NSString * const TD_ERROR_RESPONSE_DATA;

typedef NS_ENUM (NSUInteger, HTTP_METHOD) {
    HTTP_METHOD_GET,
    HTTP_METHOD_POST,
    HTTP_METHOD_PUT,
    HTTP_METHOD_DELETE
};

typedef NS_ENUM (NSUInteger, REQUEST_SERIALIZER) {
    REQUEST_SERIALIZER_JSON,
    REQUEST_SERIALIZER_HTTP
};

typedef void(^serviceCompletion)(id response, NSError *error);

@interface TDService : NSObject

@property (strong, nonatomic) NSString *td_domain;
- (void)td_initialize;

+ (id)sharedManager;

+ (NSURLSessionDataTask *)callAPI:(HTTP_METHOD)method
                             path:(NSString *)path
                       parameters:(NSDictionary *)params
                        completed:(void (^)(id res, NSError *error))completed;

+ (NSURLSessionDataTask *)callAPI:(AFAppDotNetAPIClient *)client
                           method:(HTTP_METHOD)method
                             path:(NSString *)path
                       parameters:(NSDictionary *)params
                        completed:(void (^)(id res, NSError *error))completed;



NSString * fullPath(NSString *baseUrl, NSString *shortPath);

@end

//#import "AFAppDotNetAPIClient.h"

