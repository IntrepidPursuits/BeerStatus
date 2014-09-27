//
//  ViewController.m
//  BeerStatus
//
//  Created by Colin Brash on 9/27/14.
//  Copyright (c) 2014 Intrepid Pursuits. All rights reserved.
//

#import "ViewController.h"
#import "BeerStatusManager.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *yesterdayButtons;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *todayButtons;
@property (strong, nonatomic) BeerStatusManager *beerStatusManager;
@end

@implementation ViewController

- (BeerStatusManager *)beerStatusManager {
    if (_beerStatusManager == nil) {
        _beerStatusManager = [[BeerStatusManager alloc] init];
    }
    return _beerStatusManager;
}

- (IBAction)yesterdayButtonTapped:(UIButton *)sender {
    [self.beerStatusManager setStatus:sender.titleLabel.text forDay:BeerStatusDayYesterday];
    for (UIButton *aButton in self.yesterdayButtons) {
        aButton.selected = (sender == aButton);
    }
}

- (IBAction)todayButtonTapped:(UIButton *)sender {
    [self.beerStatusManager setStatus:sender.titleLabel.text forDay:BeerStatusDayToday];
    for (UIButton *aButton in self.todayButtons) {
        aButton.selected = (sender == aButton);
    }
}

@end
