//
//  CardView.m
//  SwipeTestApp
//
//  Created by Artur Mirrov on 04.07.16.
//  Copyright © 2016 Artur Mirrov. All rights reserved.
//

#import "CardView.h"

@implementation CardView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    _imageView = [[UIImageView alloc] init];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self addSubview:_imageView];
    
    _label = [[UITextView alloc] init];
    _label.backgroundColor = [UIColor clearColor];
    _label.frame = CGRectMake(10, 10, self.frame.size.width, self.frame.size.height);
    _label.font = [UIFont systemFontOfSize:19 weight:UIFontWeightLight];
    
    [self addSubview:_label];
}

@end
