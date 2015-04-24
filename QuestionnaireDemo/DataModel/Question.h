//
//  Question.h
//  QuestionnaireDemo
//
//  Created by yake on 15/4/24.
//  Copyright (c) 2015年 yake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Logic, Option, Questionnaire, RecommendAnswers;

@interface Question : NSManagedObject

@property (nonatomic, retain) NSString * bISMust;
@property (nonatomic, retain) NSString * iAnswerNumber;
@property (nonatomic, retain) NSString * iCategory;
@property (nonatomic, retain) NSString * iCatalogID;
@property (nonatomic, retain) NSString * iCatalogSort;
@property (nonatomic, retain) NSString * iID;
@property (nonatomic, retain) NSString * iQuestionID;
@property (nonatomic, retain) NSString * iScore;
@property (nonatomic, retain) NSString * iSort;
@property (nonatomic, retain) NSString * iTemplateID;
@property (nonatomic, retain) NSString * qNum;
@property (nonatomic, retain) NSString * sCategoryText;
@property (nonatomic, retain) NSString * sDescription;
@property (nonatomic, retain) NSString * sQuestionTilte;
@property (nonatomic, retain) NSString * sShowID;
@property (nonatomic, retain) NSSet *logics;
@property (nonatomic, retain) NSSet *options;
@property (nonatomic, retain) NSSet *recommendAnswers;
@property (nonatomic, retain) Questionnaire *questionnaire;
@end

@interface Question (CoreDataGeneratedAccessors)

- (void)addLogicsObject:(Logic *)value;
- (void)removeLogicsObject:(Logic *)value;
- (void)addLogics:(NSSet *)values;
- (void)removeLogics:(NSSet *)values;

- (void)addOptionsObject:(Option *)value;
- (void)removeOptionsObject:(Option *)value;
- (void)addOptions:(NSSet *)values;
- (void)removeOptions:(NSSet *)values;

- (void)addRecommendAnswersObject:(RecommendAnswers *)value;
- (void)removeRecommendAnswersObject:(RecommendAnswers *)value;
- (void)addRecommendAnswers:(NSSet *)values;
- (void)removeRecommendAnswers:(NSSet *)values;

@end
