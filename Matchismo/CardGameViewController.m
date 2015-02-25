//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Peter Do on 1/27/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "CardGameViewController.h"
#import "Deck.h"
#import "card.h"
#import "CardMatchGame.h"

@interface CardGameViewController ()
@property (nonatomic, strong)CardMatchGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) IBOutlet UILabel *gameMessage;
@property (strong, nonatomic) IBOutlet UISegmentedControl *matchMode;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation CardGameViewController

-(CardMatchGame *)game
{
	if(!_game)_game = [[CardMatchGame alloc] initWithCardCount:[self.cardButtons count]
													 usingDeck:[self createDeck]];
	
	return _game;
}

-(Deck *)createDeck //abstract
{
	return nil;
}

- (IBAction)matchMode:(id)sender {
	int mode = [sender selectedSegmentIndex];
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setInteger:mode forKey:@"mode"];
	[defaults synchronize];
	
	printf("mode updated to index %d\n", mode);
	
	/*
	if (self.chosenButtonCount>0) {
		self.matchMode.userInteractionEnabled = NO;
	}else{
		self.matchMode.userInteractionEnabled = YES;
	}
	 */
}

- (IBAction)touchCardButton:(UIButton *)sender
{
	int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
	[self.game chooseCardAtIndex:chosenButtonIndex];
	self.matchMode.userInteractionEnabled=NO;
	[self updateUI];
}

- (IBAction)touchNewGame:(UIButton *)sender
{
	_game = [[CardMatchGame alloc] initWithCardCount:[self.cardButtons count]
										   usingDeck:[self createDeck]];
	self.matchMode.userInteractionEnabled=YES;
	[self updateUI];
}


-(void)updateUI
{
	for (UIButton *cardButton in self.cardButtons){
		int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
		Card *card = [self.game cardAtIndex:cardButtonIndex];
		[cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
		[cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
		cardButton.enabled=!card.isMatched;
		self.scoreLabel.text=[NSString stringWithFormat:@"Score %d",self.game.score];
		self.gameMessage.text=self.game.gameMessage;
	}
}

-(NSString *)titleForCard:(Card *)card
{
	return card.isChosen ? card.contents:@"";
}

-(UIImage *)backgroundImageForCard:(Card *)card
{
	return [UIImage imageNamed:card.isChosen? @"cardFront" : @"cardBack"];
}
@end
