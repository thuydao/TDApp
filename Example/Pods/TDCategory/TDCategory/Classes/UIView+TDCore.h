//
//  NSString+Core.h
//  test
//
//  Created by Dao Duy Thuy on 4/14/14.
//  Copyright ThuyDao 2014. All rights reserved.
//  Provider : Dao Duy Thuy
//

#import <UIKit/UIKit.h>


typedef void (^UIViewTDCoreBlock) ();

@interface UIView (TDCore)

@property (nonatomic, copy) UIViewTDCoreBlock blockEventOfTDCore;

#pragma mark - Get UI
- (UILabel *)td_lbWithTag:(NSInteger)tag;
- (UITextField *)td_tfWithTag:(NSInteger )tag;
- (UIImageView *)td_imvWithTag:(NSInteger)tag;
- (UIButton *)td_buttonWithTag:(NSInteger)tag;
- (UISwitch *)td_switchWithTag:(NSInteger)tag;
- (UITextView *)td_tvWithTag:(NSInteger)tag;
- (UITableView *)td_tableViewWithTag:(NSInteger)tag;
- (UIScrollView *)td_scrollViewWithTag:(NSInteger)tag;
- (UIWebView *)td_webViewWithTag:(NSInteger)tag;

#pragma mark - Add Line
// Add line top
- (void)td_addTopLineColor:(UIColor *)color;
- (void)td_addTopLineColor:(UIColor *)color withAlpha:(CGFloat )alpha;
- (void)td_addTopLineColor:(UIColor *)color withAlpha:(CGFloat )alpha withSize:(CGFloat )size;

// Add line botton
- (void)td_addBottomLineColor:(UIColor *)color;
- (void)td_addBottomLineColor:(UIColor *)color withAlpha:(CGFloat )alpha;
- (void)td_addBottomLineColor:(UIColor *)color withAlpha:(CGFloat )alpha withSize:(CGFloat )size;

// Add line left
- (void)td_addLeftLineColor:(UIColor *)color;
- (void)td_addLeftLineColor:(UIColor *)color withAlpha:(CGFloat )alpha;
- (void)td_addLeftLineColor:(UIColor *)color withAlpha:(CGFloat )alpha withSize:(CGFloat )size;

// Add line right
- (void)td_addRightLineColor:(UIColor *)color;
- (void)td_addRightLineColor:(UIColor *)color withAlpha:(CGFloat )alpha;
- (void)td_addRightLineColor:(UIColor *)color withAlpha:(CGFloat )alpha withSize:(CGFloat )size;

#pragma mark - Layer
- (void)td_borderWithBorderWidth:(CGFloat )borderWidth;
- (void)td_borderWithBorderWidth:(CGFloat )borderWidth withBoderColor:(UIColor *)color;
- (void)td_borderWithBorderWidth:(CGFloat )borderWidth withBoderColor:(UIColor *)color withCornerRadius:(CGFloat )cornerRadius;
- (void)td_borderWithBorderWidth:(CGFloat )borderWidth withBoderColor:(UIColor *)color withCornerRadius:(CGFloat )cornerRadius andWithMasksToBounds:(BOOL )isMasksToBounds;

// Corner
- (void)td_cornerTopLeftWithCornerRadius:(CGFloat )cornerRadius;
- (void)td_cornerTopRightWithCornerRadius:(CGFloat )cornerRadius;
- (void)td_cornerBottomLeftWithCornerRadius:(CGFloat )cornerRadius;
- (void)td_cornerBottomRightWithCornerRadius:(CGFloat )cornerRadius;

#pragma mark - Background Color
- (void)td_setBackgroundColorClear;
- (void)td_setBackgroundColorWithImage:(UIImage *)image;
- (void)td_setBackgroundColorWithImageName:(NSString *)imageName;

#pragma mark - Frame
#pragma mark + Set
- (void)setFrameWithX:(CGFloat )x;
- (void)setFrameWithY:(CGFloat )y;
- (void)setFrameWithX:(CGFloat )x withY:(CGFloat )y;

- (void)setFrameWithWidth:(CGFloat )width;
- (void)setFrameWithHeight:(CGFloat )height;
- (void)setFrameWithWidth:(CGFloat )width withHeight:(CGFloat )height;

- (void)setFrameWithX:(CGFloat )x withWidth:(CGFloat )width;
- (void)setFrameWithY:(CGFloat )y withHeight:(CGFloat )height;

- (void)setFrameWithX:(CGFloat )x withY:(CGFloat )y withWidth:(CGFloat )width withHeight:(CGFloat )height;

#pragma mark + Get
- (CGFloat)x;
- (CGFloat)y;
- (CGPoint)origin;
- (CGFloat)width;
- (CGFloat)height;
- (CGSize)size;

#pragma mark - Handle tap
- (void)td_addHandleSingleTapWithTarget:(id )target withAction:(SEL )action;
- (void)td_addHandleDoubleTapWithTarget:(id )target withAction:(SEL )action;


#pragma mark - Add button - Center

- (void)td_addButtonWithTarget:(id )target action:(SEL )action withX:(CGFloat )x withY:(CGFloat )y withWidth:(CGFloat )width withHeight:(CGFloat )height;

- (void)td_addButtonwithX:(CGFloat )x withY:(CGFloat )y withWidth:(CGFloat )width withHeight:(CGFloat )height;

- (void)td_addButtonAtCenterWithTarget:(id )target withAction:(SEL )action;
- (void)td_addButtonAtCenterWithTarget:(id )target withAction:(SEL )action withSize:(CGSize )size;
- (void)td_addButtonAtCenterWithBlock:(UIViewTDCoreBlock)block withSize:(CGSize)size;

#pragma mark - Add button - Other
- (void)td_addButtonWithTarget:(id )target action:(SEL )action withX:(CGFloat )x withY:(CGFloat )y;
- (void)td_addButtonWithTarget:(id )target action:(SEL )action withX:(CGFloat )x withY:(CGFloat )y withSize:(CGSize )size;

#pragma mark + Left
- (void)td_addButtonAtLeftTopWithTarget:(id )target withAction:(SEL )action;
- (void)addButtonAtLeftTopWithTarget:(id )target withAction:(SEL )action withSize:(CGSize )size;

#pragma mark + Top
- (void)td_addButtonAtTopRightWithTarget:(id )target withAction:(SEL )action;
- (void)td_addButtonAtTopRightWithTarget:(id )target withAction:(SEL )action withSize:(CGSize )size;

#pragma mark + Right
- (void)td_addButtonAtRightBottomWithTarget:(id )target withAction:(SEL )action;
- (void)addButtonAtRightBottomWithTarget:(id )target withAction:(SEL )action withSize:(CGSize )size;

#pragma mark + Botton
- (void)td_addButtonAtBottonLeftWithTarget:(id )target withAction:(SEL )action;
- (void)addButtonAtBottonLeftWithTarget:(id )target withAction:(SEL )action withSize:(CGSize )size;

@end
