//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 
 * Declare your methods here.
 
 */

-(NSArray *) arrayBySortingArrayAscending: (NSArray *) numbers;
-(NSArray *) arrayBySortingArrayDescending:(NSArray *)numbers;
-(NSArray *) arrayBySwappingFirstObjectWithLastObjectInArray: (NSArray *) items;
-(NSArray *) arrayByReversingArray: (NSArray *) items;
-(NSString *) stringInBasicLeetFromString: (NSString *) basicString;
-(NSArray *) splitArrayIntoNegativesAndPositives: (NSArray *) splitting;
-(NSArray *) namesOfHobbitsInDictionary: (NSDictionary *) hobbits;
-(NSArray *) stringsBeginningWithAInArray: (NSArray *) stringsWithA;
-(NSInteger) sumOfIntegersInArray: (NSArray *) intergersInArray;
-(NSArray *) arrayByPluralizingStringsInArray: (NSArray *) pluralStrings;
-(NSDictionary *) countsOfWordsInString: (NSString *) string;
-(NSDictionary *) songsGroupedByArtistFromArray: (NSArray *) artists;
@end
