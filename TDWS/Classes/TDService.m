//
//  TDService.m
//  GC
//
//  Created by sa vincent on 3/20/16.
//  Copyright © 2016 Moboco. All rights reserved.
//

#import "TDService.h"
#import "AFAppDotNetAPIClient.h"
#import "NSError+XPMessage.h"

typedef void(^success_callback)(NSURLSessionDataTask * __unused task, id JSON);
typedef void(^error_callback)(NSURLSessionDataTask *__unused task, NSError *error);

@implementation TDService {
}

- (void)td_initialize {
    //  TDLOG(@"");
}

+ (NSURLSessionDataTask *)callAPI:(HTTP_METHOD)method
                             path:(NSString *)path
                       parameters:(NSDictionary *)params
                        completed:(void (^)(id res, NSError *error))completed {
    
    // Log

    NSLog(@"%@", [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding]);
    
    // MARK: handle success here
    success_callback successcallback = ^(NSURLSessionDataTask * __unused task, id JSON) {
        
        dispatch_group_leave([AFAppDotNetAPIClient sharedClient].completionGroup);

        NSError * err;
        NSData * jsonData = [NSJSONSerialization dataWithJSONObject:params options:0 error:&err];
        NSString * json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"\n----------- CALL API -----------\n"
                   "URL: %@\n"
                   "METHOD: %lu\n"
                   "Params: %@\n"
                   "----------- RESPONSE SUCCESS -----------\n"
                   "\n\n %@",path,(unsigned long)method, json, JSON);

        completed(JSON, nil);
    };
    
    // MARK: handle error here
    error_callback error_callback = ^(NSURLSessionDataTask *__unused task, NSError *error) {
        
        dispatch_group_leave([AFAppDotNetAPIClient sharedClient].completionGroup);
        
        NSLog(@"\n----------- CALL API -----------\n"
                   "URL: %@\n"
                   "METHOD: %lu\n"
                   "Params: %@\n"
                   "----------- RESPONSE ERROR -----------\n"
                   "\n\n %@"
                   "\n\n %@",path,(unsigned long)method, params, error.xp_responseData, [error description]);

        NSMutableDictionary *newInfo = [error.userInfo mutableCopy];
        [newInfo setValue:error.xp_responseData_message forKey:NSLocalizedDescriptionKey];

        completed(nil, [NSError errorWithDomain:error.domain code:error.code userInfo:newInfo]);
    };
    
    if (![AFAppDotNetAPIClient sharedClient].completionGroup) {
        
        [AFAppDotNetAPIClient sharedClient].completionGroup = dispatch_group_create();
    }

    dispatch_group_enter([AFAppDotNetAPIClient sharedClient].completionGroup);
    
    // MARK: Send request to server use AFNetworking
    NSURLSessionDataTask *task;
    switch (method) {
        case HTTP_METHOD_GET:
        {
            task = [[AFAppDotNetAPIClient sharedClient] GET:path parameters:params progress:nil success:successcallback failure:error_callback];
            break;
        }
            
        case HTTP_METHOD_POST:
        {
            task = [[AFAppDotNetAPIClient sharedClient] POST:path parameters:params progress:nil success:successcallback failure:error_callback];
            break;
        }
            
        case HTTP_METHOD_DELETE:
        {
            task = [[AFAppDotNetAPIClient sharedClient] DELETE:path parameters:params success:successcallback failure:error_callback];
            break;
        }
            
        case HTTP_METHOD_PUT:
        {
            task = [[AFAppDotNetAPIClient sharedClient] PUT:path parameters:params success:successcallback failure:error_callback];
            break;
        }
            
        default:
            break;
    }
    
    return task;
}


////convert to objet or list objects when api have exis class
//+ (id)convertToObjects:(Class)aClass fromResponse:(id)response {
//  if (!aClass) {
//    return response;
//  }
//  if ([[response objectForKey:@"data"] isKindOfClass:[NSArray class]]) {
//    NSMutableArray *mutablePosts = [NSMutableArray arrayWithCapacity:[[response td_arrayForKey:@"data"] count]];
//    for (id attributes in [response td_arrayForKey:@"data"]) {
//      id obj = [[aClass alloc] init];
//      [obj setValuesForKeysWithDictionary:attributes];
//      [mutablePosts addObject:obj];
//    }
//
//    return [NSArray arrayWithArray:mutablePosts];
//  }
//  else {
//    id obj = [[aClass alloc] init];
//    [obj setValuesForKeysWithDictionary:[response td_dictionaryForKey:@"data"]];
//    return obj;
//  }
//}

#pragma mark - Path

NSString * baseUrlSite()
{
    NSString *urlSite = @"http://xpos.xdnx.smartosc.com";//@"http://x-retail-app.xd.smartosc.com";//

    return urlSite;
}

NSString * fullPath(NSString *shortPath)
{
    NSString *fullPath = [baseUrlSite() stringByAppendingString:shortPath];

    return fullPath;
}
@end
