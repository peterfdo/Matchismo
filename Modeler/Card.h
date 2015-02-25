//
//  Card.h
//  Matchismo
//
//  Created by Peter Do on 1/27/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property(nonatomic, getter=isMatched) BOOL matched;

-(int)match:(NSMutableArray *)otherCards;

@end
