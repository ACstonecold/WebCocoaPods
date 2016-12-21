//
//  AsyncURLConnection.h
//  WebView
//
//  Created by iOS developer on 15/7/3.
//  Copyright (c) 2015年 iOS developer. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^completeBlock_t)(NSData *data);
typedef void (^errorBlock_t)(NSError *error);

@interface AsyncURLConnection : NSURLConnection
{
    NSMutableData *_data;
    completeBlock_t _completeBlock;
    errorBlock_t _errorBlock;
}

+ (id)request:(NSString *)requestURL
completeBlock:(completeBlock_t) completeBlock
   errorBlock:(errorBlock_t)errorBlock;

- (id)initWithRequest:(NSString *)requestURL
        completeBlock:(completeBlock_t)completeBlock
           errorBlock:(errorBlock_t)errorBlock;
@end
