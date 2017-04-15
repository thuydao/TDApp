//
//  NSObject+TDDocument.m
//  TDDocument
//
//  Created by thuydd on 3/28/15.
//  Copyright (c) 2015 TB. All rights reserved.
//

#import "NSObject+TDDocument.h"

@implementation NSObject (TDDocument)

+ (NSString *)td_getDocumentApp {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0]; // Get documents folder
    return documentsDirectory;
}

+ (void)td_createFolderWithPath:(NSString *)folderPath {
    if (![[NSFileManager defaultManager] fileExistsAtPath:folderPath])
        [[NSFileManager defaultManager] createDirectoryAtPath:folderPath withIntermediateDirectories:NO attributes:nil error:nil]; //Create folder
}

+ (BOOL)td_removeAFileWithPath:(NSString *)filePath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;
    return [fileManager removeItemAtPath:filePath error:&error];
}

+ (NSDate *)td_dateCreationWithFilePath:(NSString *)filePath {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDate *creationDate = nil;
    if ([fileManager fileExistsAtPath:filePath]) {
        NSDictionary *attributes = [fileManager attributesOfItemAtPath:filePath error:nil];
        creationDate = attributes[NSFileCreationDate];
    }
    return creationDate;
}

@end
