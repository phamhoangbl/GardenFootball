//
//  HelperUtils.m
//  MessageApplication
//
//  Created by TruongTongXuan on 11/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HelperUtils.h"
#import "unistd.h"
#import "dlfcn.h"
#import "stdio.h"

@implementation HelperUtils

+(NSString *) getPathOfApplication{
	NSArray *paths =	NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
	NSString *path = [paths objectAtIndex:0];
    path = [path stringByAppendingFormat:@"/%@/",@"attachment"];
	return path;
}

+(NSString *) getPathSkin{
	NSArray *paths =	NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	
	NSString *path = [paths objectAtIndex:0];
    path = [path stringByAppendingFormat:@"/%@/",@"skin"];
	return path;
}

+ (void)createFolder:(NSString *) path{
	NSFileManager *fileMng = [NSFileManager defaultManager];
	if (![fileMng fileExistsAtPath:[path stringByExpandingTildeInPath]]) {
		NSArray *arrPaht = [path pathComponents];
		int i=1;
		int count =[arrPaht count];
		NSString *subPath;
		NSString *existsPath =@"";
		for (i = 0; i<count; i++) {
			subPath = [arrPaht objectAtIndex:i];
			if (![subPath isEqualToString:@"/"]) {
				subPath = [NSString stringWithFormat:@"/%@",subPath];
				existsPath = [NSString stringWithFormat:@"%@%@",existsPath,subPath];
				
				NSLog(@"full path to check===%@",existsPath);
				if (![fileMng fileExistsAtPath:[existsPath stringByExpandingTildeInPath]]) {
					NSLog(@"path to create===%@",existsPath);
                    [fileMng createDirectoryAtPath:existsPath withIntermediateDirectories:YES attributes:nil error:nil];
				}
			}
		}
		
		
	}
}
@end
