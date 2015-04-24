//
//  Option.h
//  QuestionnaireDemo
//
//  Created by yake on 15/4/24.
//  Copyright (c) 2015年 yake. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Question, Scoring;

@interface Option : NSManagedObject

@property (nonatomic, retain) NSString * bISOther;
@property (nonatomic, retain) NSString * iID;
@property (nonatomic, retain) NSString * iSort;
@property (nonatomic, retain) NSSet *scorings;
@property (nonatomic, retain) Question *question;
@end

@interface Option (CoreDataGeneratedAccessors)

- (void)addScoringsObject:(Scoring *)value;
- (void)removeScoringsObject:(Scoring *)value;
- (void)addScorings:(NSSet *)values;
- (void)removeScorings:(NSSet *)values;

@end
