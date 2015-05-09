//
//  BNRHypnosisView.m
//  Hypnosister
//
//  Created by Xiao Lu on 5/8/15.
//
//

#import "BNRHypnosisView.h"

@implementation BNRHypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];

    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    
    path.lineWidth = 10.0;
    
    [[UIColor lightGrayColor] setStroke];
    
    [path stroke];
    
    // iPhone 5 has 1136 * 640 pixels, according to the "point" definition
    // UIWindow is 568pt * 320pt
    // In the following code, width = 55 + 200 + 65
    // height = 120 + 300 + 148
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    CGRect logoFrame = CGRectMake(55, 120, 200, 300);
    
    [logoImage drawInRect:logoFrame];
}

@end
