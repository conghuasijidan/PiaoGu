//
//  YKNetWorkManager.h
//  AFN简单封装
//
//  Created by 葱花思鸡蛋 on 2017/3/29.
//  Copyright © 2017年 葱花思鸡蛋. All rights reserved.
//

#import "AFNetworking/AFNetworking.h"
/**
 *  宏定义请求成功的block
 *
 *  @param responseObject 请求成功返回的数据
 */
typedef void(^YKResponseSuccess)(NSURLSessionDataTask *task, id responseObject);

/**
 *  宏定义请求失败的block
 *
 *  @param error 报错信息
 */
typedef void(^YKResponseFail)(NSURLSessionDataTask *task, NSError *error);

/**
 *  上传或者下载的进度
 *
 *  @param progress 进度
 */
typedef void(^YKProgress)(NSProgress *progress);



@interface YKNetWorkManager : AFHTTPSessionManager

//单例
+ (YKNetWorkManager *)shareInstance;


//判断网络状态
+ (YKNetWorkManager *)netWorkStatic;


/**
 *  普通get方法请求网络数据
 *
 *  @param url     请求网址路径
 *  @param params  请求参数
 *  @param success 成功回调
 *  @param fail    失败回调
 */
+ (void)GET:(NSString *)url params:(NSDictionary *)params success:(YKResponseSuccess)success fail:(YKResponseFail)fail;


/**
 *  普通post方法请求网络数据
 *
 *  @param url     请求网址路径
 *  @param params  请求参数
 *  @param success 成功回调
 *  @param fail    失败回调
 */
+ (void)POST:(NSString *)url params:(NSDictionary *)params success:(YKResponseSuccess)success fail:(YKResponseFail)fail;

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
                 fail:(YKResponseFail)fail;

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
+ (NSURLSessionDownloadTask *)downloadWithURL:(NSString *)url savePathURL:(NSURL *)fileURL progress:(YKProgress)progress success:(void (^)(NSURLResponse *, NSURL *))success fail:(void (^)(NSError *))fail;


@end

