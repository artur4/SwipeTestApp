//
//  CustomButton.m
//  SwipeTestApp
//
//  Created by Artur Mirrov on 04.07.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

- (void)awakeFromNib {
    
    self.layer.borderWidth = 2.0;
    self.layer.cornerRadius = 3.0;
    self.layer.borderColor = [[UIColor whiteColor]CGColor];
}

@end
