//
//  Scoring.h
//  QuestionnaireDemo
//
//  Created by yake on 15/4/24.
//  Copyright (c) 2015年 yake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Option;

@interface Scoring : NSManagedObject

@property (nonatomic, retain) NSString * iID;
@property (nonatomic, retain) NSString * iSort;
@property (nonatomic, retain) NSString * sScoringOptionTitle;
@property (nonatomic, retain) Option *option;

@end
