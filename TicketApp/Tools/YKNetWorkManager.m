//
//  YKNetWorkManager.m
//  AFN简单封装
//
//  Created by 葱花思鸡蛋 on 2017/3/29.
//  Copyright © 2017年 葱花思鸡蛋. All rights reserved.
//

#import "YKNetWorkManager.h"

static int const DEFAULT_REQUEST_TIME_OUT = 20;

@implementation YKNetWorkManager
+ (YKNetWorkManager *)shareInstance
{
    // static 必须要添加，不然会出现
    static YKNetWorkManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        //初始化一些参数
        instance.responseSerializer = [AFJSONResponseSerializer serializer];
        instance.requestSerializer = [AFJSONRequestSerializer serializer];
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html", @"text/json", @"text/javascript",@"application/x-javascript",@"text/plain",@"image/gif",nil];
        instance.reachabilityManager = [AFNetworkReachabilityManager sharedManager];
        
        // 去除请求到的数据为NULL的情况
        AFJSONResponseSerializer * response = [AFJSONResponseSerializer serializer];
        response.removesKeysWithNullValues = YES;
        
        // 网络缓存，根据需求可做缓存处理
        //        instance.requestSerializer.cachePolicy = NSURLRequestReloadIgnoringCacheData;
        
        [[instance requestSerializer] setTimeoutInterval:DEFAULT_REQUEST_TIME_OUT];
        //
        
    });
    return instance;
}

//判断网络状态
+ (YKNetWorkManager *)netWorkStatic{
    static NSString *const stringURL = @"https://www.baidu.com/";
    NSURL *baseURL = [NSURL URLWithString:stringURL];
    YKNetWorkManager *manager = [[YKNetWorkManager alloc] initWithBaseURL:baseURL];
    NSOperationQueue *operationQueue = manager.operationQueue;
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未识别网络");
            case AFNetworkReachabilityStatusReachableViaWWAN:
                NSLog(@"2G,3G,4G网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                NSLog(@"WiFi");
                [operationQueue setSuspended:NO];
            }
                break;
            case AFNetworkReachabilityStatusNotReachable:
            {
                NSLog(@"无网络连接");
                
                //iOS8以上 才能使用
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:@"亲，您没网啦" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
                [alertController addAction:alertAction];
                [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
                
            }
            default:
                [operationQueue setSuspended:YES];
                break;
        }
    }];
    //开始监控
    [manager.reachabilityManager startMonitoring];
    
    return manager;
    
    
}

/**
 *  普通get方法请求网络数据
 *
 *  @param url     请求网址路径
 *  @param params  请求参数
 *  @param success 成功回调
 *  @param fail    失败回调
 */
+ (void)GET:(NSString *)url params:(NSDictionary *)params success:(YKResponseSuccess)success fail:(YKResponseFail)fail{
    
    AFHTTPSessionManager *manager = [YKNetWorkManager shareInstance];
    [manager GET:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        id dict = [YKNetWorkManager responseConfiguration:responseObject];
        //成功回调
        success(task, dict);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //失败回调
        fail(task, error);
    }];
    
}

/**
 *  普通post方法请求网络数据
 *
 *  @param url     请求网址路径
 *  @param params  请求参数
 *  @param success 成功回调
 *  @param fail    失败回调
 */
+ (void)POST:(NSString *)url params:(NSDictionary *)params success:(YKResponseSuccess)success fail:(YKResponseFail)fail
{
    AFHTTPSessionManager *manager = [YKNetWorkManager shareInstance];
    [manager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        id dic = [YKNetWorkManager responseConfiguration:responseObject];
        //成功回调
        success(task, dic);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //失败回调
        fail(task, error);
    }];
}

/**
 *  普通路径上传文件
 *
 *  @param url      请求网址路径
 *  @param params   请求参数
 *  @param filedata 文件
 *  @param name     指定参数名
 *  @param fileName 文件名（要有后缀名）
 *  @param mimeType 文件类型
 *  @param progress 上传进度
 *  @param success  成功回调
 *  @param fail     失败回调
 */
+ (void)uploadWithURL:(NSString *)url
               params:(NSDictionary *)params
             fileData:(NSData *)filedata
                 name:(NSString *)name
             fileName:(NSString *)fileName
             mimeType:(NSString *)mimeType
             progress:(YKProgress)progress
              success:(YKResponseSuccess)success
                 fail:(YKResponseFail)fail{
    AFHTTPSessionManager *manager = [YKNetWorkManager shareInstance];
    [manager POST:url parameters:params constructingBodyWithBlock:^(id  _Nonnull formData) {
        [formData appendPartWithFileData:filedata name:name fileName:fileName mimeType:mimeType];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        progress(uploadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        id dic = [YKNetWorkManager responseConfiguration:responseObject];
        success(task, dic);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(task, error);
    }];
    
    
}

/**
 *  下载文件
 *
 *  @param url      请求网络路径
 *  @param fileURL  保存文件url
 *  @param progress 下载进度
 *  @param success  成功回调
 *  @param fail     失败回调
 *
 *  @return 返回NSURLSessionDownloadTask实例，可用于暂停继续，暂停调用suspend方法，重新开启下载调用resume方法
 */
+ (NSURLSessionDownloadTask *)downloadWithURL:(NSString *)url savePathURL:(NSURL *)fileURL progress:(YKProgress)progress success:(void (^)(NSURLResponse *, NSURL *))success fail:(void (^)(NSError *))fail
{
    AFHTTPSessionManager *manager = [YKNetWorkManager shareInstance];
    
    NSURL *urlPath = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:urlPath];
    NSURLSessionDownloadTask *downLoadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        progress(downloadProgress);
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        //下载后保存的路径
        return [fileURL URLByAppendingPathComponent:[response suggestedFilename]];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        if (error) {
            fail(error);
        } else {
            success(response, filePath);
        }
        
    }];
    
    [downLoadTask resume];
    return downLoadTask;
}

#pragma mark - 简单解析数据 把JSON数据转化为字典
+ (id)responseConfiguration:(id)responseObject
{
    NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    return dic;
}
@end
