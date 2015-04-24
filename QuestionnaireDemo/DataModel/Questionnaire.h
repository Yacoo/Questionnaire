//
//  Questionnaire.h
//  QuestionnaireDemo
//
//  Created by yake on 15/4/24.
//  Copyright (c) 2015年 yake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Catelog, Info, Question;

@interface Questionnaire : NSManagedObject

@property (nonatomic, retain) NSSet *catelogs;
@property (nonatomic, retain) Info *info;
@property (nonatomic, retain) NSSet *questions;
@end

@interface Questionnaire (CoreDataGeneratedAccessors)

- (void)addCatelogsObject:(Catelog *)value;
- (void)removeCatelogsObject:(Catelog *)value;
- (void)addCatelogs:(NSSet *)values;
- (void)removeCatelogs:(NSSet *)values;

- (void)addQuestionsObject:(Question *)value;
- (void)removeQuestionsObject:(Question *)value;
- (void)addQuestions:(NSSet *)values;
- (void)removeQuestions:(NSSet *)values;

@end
