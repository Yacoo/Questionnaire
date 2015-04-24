//
//  Logic.h
//  QuestionnaireDemo
//
//  Created by yake on 15/4/24.
//  Copyright (c) 2015年 yake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Question;

@interface Logic : NSManagedObject

@property (nonatomic, retain) NSString * iID;
@property (nonatomic, retain) NSString * iLogicType;
@property (nonatomic, retain) NSString * iQuestionID;
@property (nonatomic, retain) NSString * iSelectAnswers;
@property (nonatomic, retain) NSString * iSkipFrom;
@property (nonatomic, retain) NSString * iSkipTo;
@property (nonatomic, retain) Question *question;

@end
