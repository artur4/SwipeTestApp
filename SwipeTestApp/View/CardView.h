//
//  CardView.h
//  SwipeTestApp
//
//  Created by Artur Mirrov on 04.07.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YSLCardView.h"

@interface CardView : YSLCardView

@property (strong, nonatomic) UIImageView *imageView;

@property (strong, nonatomic) UITextView *label;

@end
