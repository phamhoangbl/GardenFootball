//
//  HelperUtils.h
//  MessageApplication
//
//  Created by TruongTongXuan on 11/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef int (*airtype)();

@interface HelperUtils : NSObject

+(NSString *) getPathOfApplication;
+(NSString *) getPathSkin;
+ (void)createFolder:(NSString *) path;

@end
