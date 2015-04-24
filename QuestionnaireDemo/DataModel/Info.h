//
//  Info.h
//  QuestionnaireDemo
//
//  Created by yake on 15/4/24.
//  Copyright (c) 2015年 yake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Questionnaire;

@interface Info : NSManagedObject

@property (nonatomic, retain) NSString * iID;
@property (nonatomic, retain) NSString * iTypeID;
@property (nonatomic, retain) NSString * sCompanyName;
@property (nonatomic, retain) NSString * sTitle;
@property (nonatomic, retain) NSString * sTypeName;
@property (nonatomic, retain) Questionnaire *questionnaire;

@end
