//
//  Catelog.h
//  QuestionnaireDemo
//
//  Created by yake on 15/4/24.
//  Copyright (c) 2015年 yake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Questionnaire;

@interface Catelog : NSManagedObject

@property (nonatomic, retain) NSString * iID;
@property (nonatomic, retain) NSString * iSort;
@property (nonatomic, retain) NSString * sDescription;
@property (nonatomic, retain) NSString * sName;
@property (nonatomic, retain) Questionnaire *questionnaire;

@end
