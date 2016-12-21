//
//  AsyncURLConnection.m
//  WebView
//
//  Created by iOS developer on 15/7/3.
//  Copyright (c) 2015年 iOS developer. All rights reserved.
//

#import "AsyncURLConnection.h"

@implementation AsyncURLConnection

+ (id)request:(NSString *)requestURL completeBlock:(completeBlock_t)completeBlock errorBlock:(errorBlock_t)errorBlock
{
    return [[self alloc] initWithRequest:requestURL completeBlock:completeBlock errorBlock:errorBlock];
}

- (id)initWithRequest:(NSString *)requestURL completeBlock:(completeBlock_t)completeBlock errorBlock:(errorBlock_t)errorBlock
{
    NSURL *url = [NSURL URLWithString:requestURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    if (self = [super initWithRequest:request delegate:self startImmediately:NO])
    {
        _data = [[NSMutableData alloc] init];
        
        _completeBlock = [completeBlock copy];
        _errorBlock = [errorBlock copy];
        
        [self start];
    }
    
    return self;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [_data setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_data appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    _completeBlock(_data);
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    _errorBlock(error);
}
@end
