//
//  NSString+Core.h
//  test
//
//  Created by Dao Duy Thuy on 4/14/14.
//  Copyright ThuyDao 2014. All rights reserved.
//  Provider : Dao Duy Thuy
//

#import "UIView+TDCore.h"
#import <objc/runtime.h>

static const void *blockEventOfTDCoreVoid = &blockEventOfTDCoreVoid;
@implementation UIView (TDCore)

#pragma mark - Setter & Getter

- (UIViewTDCoreBlock)blockEventOfTDCore
{
    return objc_getAssociatedObject(self, blockEventOfTDCoreVoid);
}

- (void)setBlockEventOfTDCore:(UIViewTDCoreBlock)blockEventOfTDCore
{
    objc_setAssociatedObject(self, blockEventOfTDCoreVoid, blockEventOfTDCore, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Get UI
- (id)td_safeWithTag:(NSInteger )tag
{
    return [self viewWithTag:tag];
}

- (UILabel *)td_lbWithTag:(NSInteger )tag
{
    return [self td_safeWithTag:tag];
}

- (UITextField *)td_tfWithTag:(NSInteger )tag
{
    return [self td_safeWithTag:tag];
}

- (UIImageView *)td_imvWithTag:(NSInteger)tag
{
    return [self td_safeWithTag:tag];
}

- (UIButton *)td_buttonWithTag:(NSInteger)tag
{
    return [self td_safeWithTag:tag];
}

- (UISwitch *)td_switchWithTag:(NSInteger)tag
{
    return [self td_safeWithTag:tag];
}

- (UITextView *)td_tvWithTag:(NSInteger)tag
{
    return [self td_safeWithTag:tag];
}

- (UITableView *)td_tableViewWithTag:(NSInteger)tag
{
    return [self td_safeWithTag:tag];
}

- (UIScrollView *)td_scrollViewWithTag:(NSInteger)tag
{
    return [self td_safeWithTag:tag];
}

- (UIWebView *)td_webViewWithTag:(NSInteger)tag
{
    return [self td_safeWithTag:tag];
}

#pragma mark - Add Line
// Origin
- (void)td_addLineWithFrame:(CGRect )frame withColor:(UIColor *)color withAlpha:(CGFloat )alpha withSize:(CGFloat )size
{
    UIImageView *imageView = [[UIImageView alloc] init];
    [imageView setFrame:frame];
    [imageView setBackgroundColor:color];
    [imageView setAlpha:alpha];
    
    [self addSubview:imageView];
}

// Line Top
- (void)td_addTopLineColor:(UIColor *)color
{
    [self td_addTopLineColor:color withAlpha:1.0f withSize:1.0f];
}

- (void)td_addTopLineColor:(UIColor *)color withAlpha:(CGFloat )alpha
{
    [self td_addTopLineColor:color withAlpha:alpha withSize:1.0f];
}

- (void)td_addTopLineColor:(UIColor *)color withAlpha:(CGFloat )alpha withSize:(CGFloat )size
{
    CGRect frame = CGRectMake(0.0f, 0.0f, self.frame.size.width, size);
    
    [self td_addLineWithFrame:frame withColor:color withAlpha:alpha withSize:size];
}

// Line Bottom
- (void)td_addBottomLineColor:(UIColor *)color
{
    [self td_addBottomLineColor:color withAlpha:1.0f withSize:1.0f];
}

- (void)td_addBottomLineColor:(UIColor *)color withAlpha:(CGFloat )alpha
{
    [self td_addBottomLineColor:color withAlpha:alpha withSize:1.0f];
}

- (void)td_addBottomLineColor:(UIColor *)color withAlpha:(CGFloat )alpha withSize:(CGFloat )size
{
    CGRect frame = CGRectMake(0.0f, self.frame.size.height - size, self.frame.size.width, size);
    
    [self td_addLineWithFrame:frame withColor:color withAlpha:alpha withSize:size];
}

// Line Left
- (void)td_addLeftLineColor:(UIColor *)color
{
    [self td_addLeftLineColor:color withAlpha:1.0f withSize:1.0f];
}

- (void)td_addLeftLineColor:(UIColor *)color withAlpha:(CGFloat )alpha
{
    [self td_addLeftLineColor:color withAlpha:alpha withSize:1.0f];
}

- (void)td_addLeftLineColor:(UIColor *)color withAlpha:(CGFloat )alpha withSize:(CGFloat )size
{
    CGRect frame = CGRectMake(0.0f, 0.0f, size, self.frame.size.height);
    
    [self td_addLineWithFrame:frame withColor:color withAlpha:alpha withSize:size];
}

// Line Right
- (void)td_addRightLineColor:(UIColor *)color
{
    [self td_addRightLineColor:color withAlpha:1.0f withSize:1.0f];
}

- (void)td_addRightLineColor:(UIColor *)color withAlpha:(CGFloat )alpha
{
    [self td_addRightLineColor:color withAlpha:alpha withSize:1.0f];
}

- (void)td_addRightLineColor:(UIColor *)color withAlpha:(CGFloat )alpha withSize:(CGFloat )size
{
    CGRect frame = CGRectMake(self.frame.size.width - size, 0.0f, size, self.frame.size.height);
    
    [self td_addLineWithFrame:frame withColor:color withAlpha:alpha withSize:size];
}

#pragma mark - Layer
- (void)td_borderWithBorderWidth:(CGFloat )borderWidth
{
    [self td_borderWithBorderWidth:borderWidth withBoderColor:[UIColor clearColor] withCornerRadius:0.0f andWithMasksToBounds:YES];
}

- (void)td_borderWithBorderWidth:(CGFloat )borderWidth withBoderColor:(UIColor *)color
{
    [self td_borderWithBorderWidth:borderWidth withBoderColor:color withCornerRadius:0.0f andWithMasksToBounds:YES];
}

- (void)td_borderWithBorderWidth:(CGFloat )borderWidth withBoderColor:(UIColor *)color withCornerRadius:(CGFloat )cornerRadius
{
    [self td_borderWithBorderWidth:borderWidth withBoderColor:color withCornerRadius:cornerRadius andWithMasksToBounds:YES];
}

- (void)td_borderWithBorderWidth:(CGFloat )borderWidth withBoderColor:(UIColor *)color withCornerRadius:(CGFloat )cornerRadius andWithMasksToBounds:(BOOL )isMasksToBounds
{
    self.layer.borderColor = [color CGColor];
    self.layer.borderWidth = borderWidth;
    
    self.layer.cornerRadius = cornerRadius;
    
    self.layer.masksToBounds = isMasksToBounds;
}

// Corner
- (void)td_cornerTopLeftWithCornerRadius:(CGFloat )cornerRadius
{
    UIRectCorner corner = UIRectCornerTopLeft;
    
    [self td_cornerWithRectConrder:corner withCornerRadius:cornerRadius];
}

- (void)td_cornerTopRightWithCornerRadius:(CGFloat )cornerRadius
{
    UIRectCorner corner = UIRectCornerTopRight;
    
    [self td_cornerWithRectConrder:corner withCornerRadius:cornerRadius];
}

- (void)td_cornerBottomLeftWithCornerRadius:(CGFloat )cornerRadius
{
    UIRectCorner corner = UIRectCornerBottomLeft;
    
    [self td_cornerWithRectConrder:corner withCornerRadius:cornerRadius];
}

- (void)td_cornerBottomRightWithCornerRadius:(CGFloat )cornerRadius
{
    UIRectCorner corner = UIRectCornerBottomRight;
    
    [self td_cornerWithRectConrder:corner withCornerRadius:cornerRadius];
}

- (void)td_cornerWithRectConrder:(UIRectCorner )corner withCornerRadius:(CGFloat )cornerRadius
{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

#pragma mark - Background Color
- (void)td_setBackgroundColorClear
{
    [self setBackgroundColor:[UIColor clearColor]];
}

- (void)td_setBackgroundColorWithImage:(UIImage *)image
{
    [self setBackgroundColor:[UIColor colorWithPatternImage:image]];
}

- (void)td_setBackgroundColorWithImageName:(NSString *)imageName
{
    [self td_setBackgroundColorWithImage:[UIImage imageNamed:imageName]];
}

#pragma mark - Frame
#pragma mark + Set
- (void)setFrameWithX:(CGFloat )x
{
    [self setFrameWithX:x withY:[self y] withWidth:[self width] withHeight:[self height]];
}

- (void)setFrameWithY:(CGFloat )y
{
    [self setFrameWithX:[self x] withY:y withWidth:[self width] withHeight:[self height]];
}

- (void)setFrameWithX:(CGFloat )x withY:(CGFloat )y
{
    [self setFrameWithX:x withY:y withWidth:[self width] withHeight:[self height]];
}

- (void)setFrameWithWidth:(CGFloat )width
{
    [self setFrameWithX:[self x] withY:[self y] withWidth:width withHeight:[self height]];
}

- (void)setFrameWithHeight:(CGFloat )height
{
    [self setFrameWithX:[self x] withY:[self y] withWidth:[self width] withHeight:height];
}

- (void)setFrameWithWidth:(CGFloat )width withHeight:(CGFloat )height
{
    [self setFrameWithX:[self x] withY:[self y] withWidth:width withHeight:height];
}

- (void)setFrameWithX:(CGFloat )x withWidth:(CGFloat )width
{
    [self setFrameWithX:x withY:[self y] withWidth:width withHeight:[self height]];
}

- (void)setFrameWithY:(CGFloat )y withHeight:(CGFloat )height
{
    [self setFrameWithX:[self x] withY:y withWidth:[self width] withHeight:height];
}

- (void)setFrameWithX:(CGFloat )x withY:(CGFloat )y withWidth:(CGFloat )width withHeight:(CGFloat )height
{
    [self setFrame:CGRectMake(x, y, width, height)];
}

#pragma mark + Get
- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (CGSize)size
{
    return self.frame.size;
}

#pragma mark - Position

#pragma mark - Handle tap
- (void)td_addHandleSingleTapWithTarget:(id )target withAction:(SEL )action
{
    [self td_addHandleTapWithTarget:target withAction:action withNumberOfTap:1];
}

- (void)td_addHandleDoubleTapWithTarget:(id )target withAction:(SEL )action
{
    [self td_addHandleTapWithTarget:target withAction:action withNumberOfTap:2];
}

- (void)td_addHandleTapWithTarget:(id )target withAction:(SEL )action withNumberOfTap:(NSInteger )numberOfTap
{
    [self setUserInteractionEnabled:YES];
    
    UITapGestureRecognizer *handleDoubleTapSendQLog = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    handleDoubleTapSendQLog.numberOfTapsRequired = numberOfTap;
    handleDoubleTapSendQLog.numberOfTouchesRequired = numberOfTap;
    
    [self addGestureRecognizer:handleDoubleTapSendQLog];
}

#pragma mark - Add button - Center

- (void)td_addButtonWithTarget:(id )target action:(SEL )action withX:(CGFloat )x withY:(CGFloat )y withWidth:(CGFloat )width withHeight:(CGFloat )height
{
    CGRect frame = CGRectMake(x, y, width, height);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setBackgroundColor:[UIColor clearColor]];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [self.superview addSubview:button];
}

- (void)td_addButtonwithX:(CGFloat )x withY:(CGFloat )y withWidth:(CGFloat )width withHeight:(CGFloat )height
{
    CGRect frame = CGRectMake(x, y, width, height);
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:frame];
    [button setBackgroundColor:[UIColor clearColor]];
    [button addTarget:self action:@selector(eventOfButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.superview addSubview:button];
}

- (void)td_addButtonAtCenterWithTarget:(id )target withAction:(SEL )action
{
    [self td_addButtonAtCenterWithTarget:target withAction:action withSize:CGSizeMake(30.0, 30.0)];
}

- (void)td_addButtonAtCenterWithTarget:(id )target withAction:(SEL )action withSize:(CGSize )size
{
    CGFloat width = size.width;
    if ( self.frame.size.width > width )
    {
        width = self.frame.size.width;
    }
    
    CGFloat height = size.height;
    if ( self.frame.size.height > height )
    {
        height = self.frame.size.height;
    }
    
    CGFloat x = self.center.x - (width / 2);
    CGFloat y = self.center.y - (height / 2);
    
    [self td_addButtonWithTarget:target action:action withX:x withY:y withWidth:width withHeight:height];
}

- (void)td_addButtonAtCenterWithBlock:(UIViewTDCoreBlock)block withSize:(CGSize)size
{
    self.blockEventOfTDCore = block;
    CGFloat width = size.width;
    if ( self.frame.size.width > width )
    {
        width = self.frame.size.width;
    }
    
    CGFloat height = size.height;
    if ( self.frame.size.height > height )
    {
        height = self.frame.size.height;
    }
    
    CGFloat x = self.center.x - (width / 2);
    CGFloat y = self.center.y - (height / 2);
    
    [self td_addButtonwithX:x withY:y withWidth:width withHeight:height];
}

#pragma mark - Add button - Other
- (void)td_addButtonWithTarget:(id )target action:(SEL )action withX:(CGFloat )x withY:(CGFloat )y
{
    [self td_addButtonWithTarget:target action:action withX:x withY:y withSize:CGSizeMake(30.0, 30.0)];
}

- (void)td_addButtonWithTarget:(id )target action:(SEL )action withX:(CGFloat )x withY:(CGFloat )y withSize:(CGSize )size
{
    CGFloat width = size.width;
    if ( self.frame.size.width > width )
    {
        width = self.frame.size.width;
    }
    
    CGFloat height = size.height;
    if ( self.frame.size.height > height )
    {
        height = self.frame.size.height;
    }
    
    [self td_addButtonWithTarget:target action:action withX:x withY:y withWidth:width withHeight:height];
}

#pragma mark + Left
- (void)td_addButtonAtLeftTopWithTarget:(id )target withAction:(SEL )action
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y;
    
    [self td_addButtonWithTarget:target action:action withX:x withY:y];
}

- (void)addButtonAtLeftTopWithTarget:(id )target withAction:(SEL )action withSize:(CGSize )size
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y;
    
    [self td_addButtonWithTarget:target action:action withX:x withY:y withSize:size];
}

#pragma mark + Top
- (void)td_addButtonAtTopRightWithTarget:(id )target withAction:(SEL )action
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y;
    
    [self td_addButtonWithTarget:target action:action withX:x withY:y];
}

- (void)td_addButtonAtTopRightWithTarget:(id )target withAction:(SEL )action withSize:(CGSize )size
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y;
    
    [self td_addButtonWithTarget:target action:action withX:x withY:y withSize:size];
}

#pragma mark + Right
- (void)td_addButtonAtRightBottomWithTarget:(id )target withAction:(SEL )action
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    
    [self td_addButtonWithTarget:target action:action withX:x withY:y];
}

- (void)addButtonAtRightBottomWithTarget:(id )target withAction:(SEL )action withSize:(CGSize )size
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    
    [self td_addButtonWithTarget:target action:action withX:x withY:y withSize:size];
}

#pragma mark + Botton
- (void)td_addButtonAtBottonLeftWithTarget:(id )target withAction:(SEL )action
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    
    [self td_addButtonWithTarget:target action:action withX:x withY:y];
}

- (void)addButtonAtBottonLeftWithTarget:(id )target withAction:(SEL )action withSize:(CGSize )size
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    
    [self td_addButtonWithTarget:target action:action withX:x withY:y withSize:size];
}

- (void)eventOfButton:(UIButton *)sender
{
    if (self.blockEventOfTDCore) {
        self.blockEventOfTDCore();
    }
}

@end
