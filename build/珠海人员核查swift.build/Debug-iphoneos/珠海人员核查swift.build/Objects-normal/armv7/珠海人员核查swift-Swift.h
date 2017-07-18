// Generated by Apple Swift version 3.0 (swiftlang-800.0.46.2 clang-800.0.38)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import Foundation;
@import ObjectiveC;
@import CoreGraphics;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIWindow;
@class UIApplication;

SWIFT_CLASS("_TtC23珠海人员核查swift11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic, strong) UIWindow * _Nullable window;
@property (nonatomic) BOOL state_URL;
- (BOOL)application:(UIApplication * _Nonnull)application didFinishLaunchingWithOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> * _Nullable)launchOptions;
- (UIInterfaceOrientationMask)application:(UIApplication * _Nonnull)application supportedInterfaceOrientationsForWindow:(UIWindow * _Nullable)window;
- (BOOL)application:(UIApplication * _Nonnull)app openURL:(NSURL * _Nonnull)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> * _Nonnull)options;
/**
  <hr/>
*/
- (BOOL)launchOptionWithUrlIsNotEmptyWithLaunchOptions:(NSDictionary<UIApplicationLaunchOptionsKey, id> * _Nullable)launchOptions;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UIFont;

SWIFT_CLASS("_TtC23珠海人员核查swift9Calculate")
@interface Calculate : NSObject
+ (CGSize)meareTextWithText:(NSString * _Nonnull)text font:(UIFont * _Nonnull)font maxSize:(CGSize)maxSize;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


@interface NSDateFormatter (SWIFT_EXTENSION(珠海人员核查swift))
- (NSString * _Nonnull)setDate;
@end

@class NSNotification;

SWIFT_CLASS("_TtC23珠海人员核查swift11EventHandle")
@interface EventHandle : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) EventHandle * _Nonnull shareInstance;)
+ (EventHandle * _Nonnull)shareInstance;
- (void)handleInputEventWithText:(NSString * _Nonnull)text;
- (void)handleDeleteEvent;
- (void)handleDeleteAll;
- (void)handleKeyBoardWillShowActionWithNoti:(NSNotification * _Nonnull)noti;
- (void)handlekeyBoardWillHideActionWithNoti:(NSNotification * _Nonnull)noti;
- (void)handleOnQueryWithNewIdentifierNumWithText:(NSString * _Nonnull)text;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC23珠海人员核查swift9Exception")
@interface Exception : NSObject
+ (void)exceptionDetails;
+ (BOOL)isEmptyWithVauleWithValue:(NSString * _Nonnull)value;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC23珠海人员核查swift13FilterManager")
@interface FilterManager : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) FilterManager * _Nonnull shareInstance;)
+ (FilterManager * _Nonnull)shareInstance;
- (BOOL)checkIdentifierWithIdWithString:(NSString * _Nonnull)string;
- (BOOL)checkDate8WithDate:(NSString * _Nonnull)date;
- (BOOL)checkDateWithDateWithYear:(int32_t)year month:(int32_t)month day:(int32_t)day;
- (BOOL)isIdentifierLength_18WithDate:(NSString * _Nonnull)date;
- (BOOL)checkIdentifierWithNumWithDate:(NSString * _Nonnull)date;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class OS_dispatch_queue;

SWIFT_CLASS("_TtC23珠海人员核查swift7GCDTask")
@interface GCDTask : NSObject
@property (nonatomic, readonly, strong) OS_dispatch_queue * _Nonnull backQueue;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class NSCoder;
@class UIButton;

SWIFT_CLASS("_TtC23珠海人员核查swift18IdentifierKeyBoard")
@interface IdentifierKeyBoard : UIView
@property (nonatomic, copy) NSArray<NSString *> * _Null_unspecified datas;
@property (nonatomic, readonly, strong) EventHandle * _Nonnull eventHandle;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)loadView;
- (void)addBtnWithParamtersWithRow:(NSInteger)row col:(NSInteger)col index:(NSInteger)index;
- (void)setbtnTitleWithParmetersWithIndex:(NSInteger)index btn:(UIButton * _Nonnull)btn;
- (void)setNormalIndexWithIndex:(NSInteger)index btn:(UIButton * _Nonnull)btn;
- (void)setSpecialIndexWithIndex:(NSInteger)index btn:(UIButton * _Nonnull)btn;
- (void)addVertrialLineWithCol:(NSInteger)col;
- (void)addHorizontalLineWithRow:(NSInteger)row;
- (void)onBtnTappedWithSender:(UIButton * _Nonnull)sender;
- (void)onBtnLongPressedWithSender:(UIButton * _Nonnull)sender;
@end

@class UITextField;
@class UITapGestureRecognizer;

SWIFT_CLASS("_TtC23珠海人员核查swift14InputFieldView")
@interface InputFieldView : UIView <UITextFieldDelegate>
@property (nonatomic, readonly, strong) EventHandle * _Nonnull eventHander;
@property (nonatomic, strong) UIView * _Nonnull hor_top;
@property (nonatomic, strong) UIView * _Nonnull hor_bottom;
@property (nonatomic, strong) IdentifierKeyBoard * _Nonnull inputKeyBoard;
@property (nonatomic, strong) UIButton * _Nonnull submitBtn;
@property (nonatomic, strong) UITextField * _Nonnull inputTextField;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)addAllChildView;
- (void)listenKeyboardState;
- (void)onDeleteAll;
- (void)onDelete;
- (void)onInputWithText:(NSString * _Nonnull)text;
- (void)onKeyboardWillShowWithNoti:(NSNotification * _Nonnull)noti;
- (void)onKeyboardWillHideWithNoti:(NSNotification * _Nonnull)noti;
/**
  <hr/>
*/
- (BOOL)textField:(UITextField * _Nonnull)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString * _Nonnull)string;
- (void)setSubmitBtnStateWithBtn:(UIButton * _Nonnull)btn;
- (void)onquery;
- (void)didTextChanged;
- (void)rebuildFrameWithNoti:(NSNotification * _Nonnull)noti;
- (void)recoverKeyboardFrameWithNoti:(NSNotification * _Nonnull)noti;
- (void)onTouchInWindowWithUiTap:(UITapGestureRecognizer * _Nonnull)uiTap;
- (void)touchInWindowWithView:(UIView * _Nonnull)view;
- (void)showInputField;
- (void)hideInputField;
- (void)hideSubMitBtn;
@end


SWIFT_CLASS("_TtC23珠海人员核查swift3Log")
@interface Log : NSObject
+ (void)logWithUsefulParamtersWithHeadString:(NSString * _Nonnull)headString bodyString:(NSObject * _Nonnull)bodyString;
+ (void)logWithUsefulStringParamtersWithHeadString:(NSString * _Nonnull)headString bodyString:(NSString * _Nonnull)bodyString;
+ (void)logWithUsefulIntParamtersWithHeadString:(NSString * _Nonnull)headString bodyString:(NSInteger)bodyString;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC23珠海人员核查swift11ParseCenter")
@interface ParseCenter : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class OS_dispatch_semaphore;

SWIFT_CLASS("_TtC23珠海人员核查swift12QueueManager")
@interface QueueManager : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) QueueManager * _Nonnull shareInstance;)
+ (QueueManager * _Nonnull)shareInstance;
@property (nonatomic, strong) OS_dispatch_semaphore * _Nullable ryRequestSemp;
- (void)semaphoreCreateWithNumWithNum:(NSInteger)num;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class NSUserDefaults;

SWIFT_CLASS("_TtC23珠海人员核查swift12RequestParam")
@interface RequestParam : NSObject
@property (nonatomic, readonly, strong) NSUserDefaults * _Nonnull user;
@property (nonatomic, copy) NSString * _Nullable userName;
@property (nonatomic, copy) NSString * _Nullable userId;
@property (nonatomic, copy) NSString * _Nullable mobile;
@property (nonatomic, copy) NSString * _Nullable acToken;
@property (nonatomic, copy) NSString * _Nullable uuid;
@property (nonatomic, copy) NSString * _Nullable orgid;
@property (nonatomic, copy) NSString * _Nullable identifier;
@property (nonatomic, copy) NSString * _Nullable appVerson;
- (void)getIdentifierWithId:(NSString * _Nonnull)id;
- (void)getRequestParam;
- (NSDictionary<NSString *, NSString *> * _Nonnull)setDic;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC23珠海人员核查swift13RyCompareItem")
@interface RyCompareItem : NSObject
@property (nonatomic, copy) NSString * _Nonnull color;
@property (nonatomic, copy) NSString * _Nonnull desc;
@property (nonatomic, copy) NSString * _Nonnull code;
@property (nonatomic, copy) NSString * _Nonnull weight;
- (void)parseDataWithResult:(id _Nonnull)result;
- (BOOL)isErr;
- (BOOL)isQgCk;
- (BOOL)isIllega;
- (NSArray<NSString *> * _Nonnull)getIllageDataWithItemObject:(id _Nonnull)itemObject;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class RyResultItem;

SWIFT_CLASS("_TtC23珠海人员核查swift6RyItem")
@interface RyItem : NSObject
@property (nonatomic, readonly, strong) NSDateFormatter * _Nonnull dateFormatter;
@property (nonatomic, copy) NSString * _Nonnull identifier;
@property (nonatomic, copy) NSString * _Nonnull queryTime;
@property (nonatomic, copy) NSString * _Nonnull resultTime;
@property (nonatomic, copy) NSArray<RyCompareItem *> * _Nonnull compareResult;
@property (nonatomic, copy) NSDictionary<NSString *, NSString *> * _Nonnull extParams;
@property (nonatomic, copy) NSArray<RyResultItem *> * _Nonnull ryDataResult;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull compareIllegalArr;
@property (nonatomic) BOOL isWfjl;
- (void)setQueryTime;
- (void)parseDataWithData:(NSString * _Nonnull)data;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UILabel;
@class UIImageView;

SWIFT_CLASS("_TtC23珠海人员核查swift10RyItemCell")
@interface RyItemCell : UIView
@property (nonatomic, strong) UILabel * _Nonnull namelabel;
@property (nonatomic, strong) UILabel * _Nonnull valueLabel;
@property (nonatomic, strong) UIImageView * _Nonnull ryheadImageView;
/**
  <hr/>
*/
- (void)setNormalData_frameWithData:(RyResultItem * _Nonnull)data width:(CGFloat)width;
- (void)setSpecData_frameWithData:(RyResultItem * _Nonnull)data;
- (nonnull instancetype)initWithFrame:(CGRect)frame OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class NSAttributedString;
@class UIImage;

SWIFT_CLASS("_TtC23珠海人员核查swift12RyResultItem")
@interface RyResultItem : NSObject
@property (nonatomic, copy) NSString * _Nonnull color;
@property (nonatomic, copy) NSString * _Nonnull name;
@property (nonatomic, copy) NSString * _Nonnull key;
@property (nonatomic, copy) NSString * _Nonnull value;
@property (nonatomic, copy) NSString * _Nonnull hcjgkey;
@property (nonatomic, copy) NSString * _Nonnull wfjlKey;
@property (nonatomic, copy) NSString * _Nonnull hcjgName;
@property (nonatomic, copy) NSString * _Nonnull wfjlName;
@property (nonatomic, copy) NSArray<NSString *> * _Nonnull wfjlArr;
@property (nonatomic, strong) NSAttributedString * _Nonnull hcjgValue;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
- (void)parseDataWithResult:(id _Nonnull)result;
- (BOOL)isErr;
- (BOOL)isRyheadIcon;
- (BOOL)isCompareResultItem;
- (UIImage * _Nonnull)createHeadImage;
+ (RyResultItem * _Nonnull)createWjjlItemWithIsWfjl:(BOOL)isWfjl illegaArr:(NSArray<NSString *> * _Nonnull)illegaArr;
@end

@class UIActivityIndicatorView;

SWIFT_CLASS("_TtC23珠海人员核查swift8RyhcCell")
@interface RyhcCell : UITableViewCell
@property (nonatomic, copy) NSArray<RyResultItem *> * _Nonnull allItems;
@property (nonatomic, copy) NSArray<RyItemCell *> * _Nonnull normalItems;
@property (nonatomic, copy) NSArray<RyItemCell *> * _Nonnull specItems;
@property (nonatomic, strong) UILabel * _Nonnull queryTimeView;
@property (nonatomic, strong) UITextField * _Nonnull identifierView;
@property (nonatomic, strong) UIActivityIndicatorView * _Nonnull indicatorView;
@property (nonatomic, strong) UILabel * _Nonnull resultTimeView;
@property (nonatomic, strong) UIImageView * _Nonnull resultBgView;
@property (nonatomic, strong) UILabel * _Nonnull falseLable;
- (nonnull instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString * _Nullable)reuseIdentifier OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
- (void)configDataWithData:(RyItem * _Nonnull)data;
- (void)setInqueryFrame;
- (void)setSuccessFulFrameWithData:(RyItem * _Nonnull)data;
- (void)setItemFrameWithData:(RyResultItem * _Nonnull)data tag:(NSInteger)tag index:(NSInteger)index finished:(void (^ _Nonnull)(float))finished;
- (void)setCompareItemFrameWithData:(RyResultItem * _Nonnull)data index:(NSInteger)index finished:(void (^ _Nonnull)(float))finished;
@end


SWIFT_CLASS("_TtC23珠海人员核查swift12StateManager")
@interface StateManager : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, strong) StateManager * _Nonnull shareInstance;)
+ (StateManager * _Nonnull)shareInstance;
- (void)notifWindowToDealWithIn_QueryAction;
- (void)notifWindowToDealWithSuccessAction;
- (void)notifuWindowToDealWithFalseAction;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


@interface UIColor (SWIFT_EXTENSION(珠海人员核查swift))
+ (UIColor * _Nonnull)uiColorWithValue:(NSString * _Nonnull)value;
@end


@interface UIImage (SWIFT_EXTENSION(珠海人员核查swift))
+ (UIImage * _Nonnull)uiImageWithSizeWithSize:(CGSize)size color:(UIColor * _Nonnull)color;
- (UIImage * _Nonnull)uiImageWithPartsWithName:(NSString * _Nonnull)name mobile:(NSString * _Nonnull)mobile;
@end

@class NSError;

SWIFT_CLASS("_TtC23珠海人员核查swift10UrlConnect")
@interface UrlConnect : NSObject
+ (void)postWithUrlString:(NSString * _Nonnull)urlString params:(NSDictionary<NSString *, NSString *> * _Nonnull)params callback:(void (^ _Nonnull)(NSString * _Nullable, NSError * _Nullable))callback;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class UIScrollView;
@class UITextView;
@class NSBundle;

SWIFT_CLASS("_TtC23珠海人员核查swift12VersonHelpVC")
@interface VersonHelpVC : UIViewController
@property (nonatomic, readonly, copy) NSString * _Nonnull dealString;
/**
  <hr/>
*/
@property (nonatomic, strong) UIScrollView * _Nonnull scroolView;
@property (nonatomic, strong) UIView * _Nonnull headView;
@property (nonatomic, strong) UIImageView * _Nonnull headImageView;
@property (nonatomic, strong) UILabel * _Nonnull headNameLabel;
@property (nonatomic, strong) UILabel * _Nonnull headVersionLabel;
@property (nonatomic, strong) UILabel * _Nonnull textLable;
@property (nonatomic, strong) UITextView * _Nonnull detailView;
@property (nonatomic, strong) UILabel * _Nonnull companySupport;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)didReceiveMemoryWarning;
- (void)initSubView SWIFT_METHOD_FAMILY(none);
- (void)initHeadChildView SWIFT_METHOD_FAMILY(none);
- (NSAttributedString * _Nonnull)changeStringToAttrString;
- (void)setleftbackBtn;
- (void)setBtnBackImageWithBtn:(UIButton * _Nonnull)btn;
/**
  <hr/>
*/
- (void)popViewControllerWithSender:(UIButton * _Nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UITableView;

SWIFT_CLASS("_TtC23珠海人员核查swift14ViewController")
@interface ViewController : UIViewController <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, readonly) float keyboardHeight;
@property (nonatomic, readonly, copy) NSString * _Nonnull identifier;
@property (nonatomic, readonly, strong) EventHandle * _Nonnull eventhandler;
@property (nonatomic, readonly, strong) FilterManager * _Nonnull filterManager;
@property (nonatomic, readonly, strong) StateManager * _Nonnull stateManager;
@property (nonatomic, readonly, strong) QueueManager * _Nonnull queueManager;
@property (nonatomic, readonly, strong) RequestParam * _Nonnull requestParam;
@property (nonatomic, copy) NSArray<RyItem *> * _Nonnull wholeArray;
@property (nonatomic, strong) UITableView * _Nonnull listView;
@property (nonatomic, strong) UILabel * _Nonnull centerLabel;
@property (nonatomic, strong) UIImageView * _Nonnull warterMarkView;
@property (nonatomic, strong) InputFieldView * _Nonnull inputField;
/**
  <hr/>
*/
- (void)viewWillAppear:(BOOL)animated;
- (void)viewDidLoad;
- (void)viewDidAppear:(BOOL)animated;
- (void)didReceiveMemoryWarning;
- (void)viewWillDisappear:(BOOL)animated;
- (NSInteger)tableView:(UITableView * _Nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath;
/**
  <hr/>
*/
- (void)onQueryWithTextStringWithText:(NSString * _Nonnull)text;
- (void)onKeyBoardWillShowWithNoti:(NSNotification * _Nonnull)noti;
- (void)onKeyBoardWillHideWithNoti:(NSNotification * _Nonnull)noti;
- (void)rebuildTableViewFrameWithKeyBoardWillShowNotificationWithNoti:(NSNotification * _Nonnull)noti;
- (void)recoverTableViewFrameWithKeyBoardWillHideNotificationWithNoti:(NSNotification * _Nonnull)noti;
/**
  <hr/>
*/
- (void)onInQuery;
- (void)onSuccessQuery;
- (void)onFalesQuery;
- (void)setWatermark;
- (void)waterMarkSetWithUserNameAndMobieNumWithName:(NSString * _Nonnull)name mobieNum:(NSString * _Nonnull)mobieNum;
- (void)setViewElementFrame;
- (void)setWaterMarkFrameWithLine:(CGFloat)line;
- (void)setRightNavItem;
- (void)setBtnBackImageWithBtn:(UIButton * _Nonnull)btn;
- (void)pushViewControllerWithSender:(UIButton * _Nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * _Nullable)nibNameOrNil bundle:(NSBundle * _Nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * _Nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop
