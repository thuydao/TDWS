// AFAppDotNetAPIClient.h
//
// Copyright (c) 2011–2016 Alamofire Software Foundation ( http://alamofire.org/ )
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface AFAppDotNetAPIClient : AFHTTPSessionManager

@property (nonatomic, assign) NSInteger currentRetry;
@property (nonatomic, assign) NSInteger maxRetry;

@property (nonatomic, assign) BOOL enableLog; //default NO;

+ (instancetype)sharedClient;

/* Reset AFAppDotNetAPIClient with new base URL string (by pass session). */
+ (void)setupBaseUrl:(NSURL *)url;

+ (void)useJSONRequestSerializer;
+ (void)useHTTPRequestSerializer;

+ (void)authorizationUsr:(NSString *)usr pwd:(NSString *)pwd;

//- (instancetype)initWithBaseUrl:(NSURL *)url;
+ (AFAppDotNetAPIClient *)newJSONRequestSerializerWithBaseUrl:(NSURL *)url;
+ (AFAppDotNetAPIClient *)newHTTPRequestSerializerWithBaseUrl:(NSURL *)url;
- (void)useJSONRequestSerializer;
- (void)useHTTPRequestSerializer;
- (void)authorizationUsr:(NSString *)usr pwd:(NSString *)pwd;
- (void)authorizationToken:(NSString *)token;


- (void)refreshTokenWithCompleted:(void (^)(id res, NSError *error))completed;

@end
