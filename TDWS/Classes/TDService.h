//
//  TDService.h
//  GC
//
//  Created by sa vincent on 3/20/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

#define CONFIG_PATH            @"/api/v1"//@"/xrest/v1/xretail/xproduct"
#define CONFIG_NEW_PATH        @"/xrest/v1/xretail"
#define CLIENT_ID              @"ios_app"
#define CLIENT_SECRET          @"demo"

#import <Foundation/Foundation.h>
#import <TDCore/TDCore.h>

typedef NS_ENUM (NSUInteger, HTTP_METHOD) {
    HTTP_METHOD_GET,
    HTTP_METHOD_POST,
    HTTP_METHOD_PUT,
    HTTP_METHOD_DELETE
};

typedef void(^serviceCompletion)(id response, NSError *error);

@interface TDService : TDBaseObject

@property (strong, nonatomic) NSString *td_domain;

+ (NSURLSessionDataTask *)callAPI:(HTTP_METHOD)method
                             path:(NSString *)path
                       parameters:(NSDictionary *)params
                    completed:(void (^)(id res, NSError *error))completed;


// NSString * baseUrlSite();

NSString * fullPath(NSString *shortPath);

@end

#import "AFAppDotNetAPIClient.h"

