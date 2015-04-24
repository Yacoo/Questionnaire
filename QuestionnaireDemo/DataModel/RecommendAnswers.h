//
//  RecommendAnswers.h
//  QuestionnaireDemo
//
//  Created by yake on 15/4/24.
//  Copyright (c) 2015年 yake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Question;

@interface RecommendAnswers : NSManagedObject

@property (nonatomic, retain) NSString * iID;
@property (nonatomic, retain) NSString * sTitle;
@property (nonatomic, retain) Question *question;

@end
