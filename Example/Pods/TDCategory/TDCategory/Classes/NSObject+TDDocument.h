//
//  NSObject+TDDocument.h
//  TDDocument
//
//  Created by thuydd on 3/28/15.
//  Copyright (c) 2015 TB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (TDDocument)

+ (NSString *)td_getDocumentApp;

+ (void)td_createFolderWithPath:(NSString *)folderPath;

+ (BOOL)td_removeAFileWithPath:(NSString *)filePath;

+ (NSDate *)td_dateCreationWithFilePath:(NSString *)filePath;

@end
