//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSArray *) arrayBySortingArrayAscending: (NSArray *) numbers {
    
    NSSortDescriptor *sortByAscending = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    numbers = [numbers sortedArrayUsingDescriptors:@[sortByAscending]];
    
    //NSLog(@"%@", numbers);
    return numbers;
}

-(NSArray *) arrayBySortingArrayDescending:(NSArray *)numbers {
    
    NSSortDescriptor *sortByDescending = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    numbers = [numbers sortedArrayUsingDescriptors:@[sortByDescending]];
    
    //NSLog(@"%@", numbers);
    return numbers;
}

-(NSArray *) arrayBySwappingFirstObjectWithLastObjectInArray: (NSArray *) items {
 
    NSMutableArray *newItems = [items mutableCopy];
    
    [newItems exchangeObjectAtIndex:0 withObjectAtIndex:[items count]-1];
    //[newItems replaceObjectAtIndex:0 withObject:[items lastObject]];// index[-1]<-- this is Ruby, stop doing this/ [item count]-1] <-- this only gives me the index/ items[[items count]-1] would be the same as [items lastObject]
    
    //NSLog(@"%@", newItems);
    return newItems;
    
}

-(NSArray *) arrayByReversingArray: (NSArray *) items {
    
    NSMutableArray *newItems = [items mutableCopy];
    return [[newItems reverseObjectEnumerator] allObjects]; // go over NSEnumerators again
    return 0;
}

-(NSString *) stringInBasicLeetFromString: (NSString *) basicString {

    NSDictionary *charChange = @{ @"a" : @"4",
                                  @"s" : @"5",
                                  @"i" : @"1",
                                  @"l" : @"1",
                                  @"e" : @"3",
                                  @"t" : @"7"};
    
    NSString *string = basicString;// by using "string" I'm permenantly changing it, it being the string. if I used basicString it would always convert back to the original string
    for(NSString *key in [charChange allKeys]) {
     
      string = [string stringByReplacingOccurrencesOfString:key withString:charChange[key]];
        
        NSLog(@"%@", string);
        NSLog(@"%@", key);
        NSLog(@"%@", charChange[key]);
    }
   
    return string;
}

-(NSArray *) splitArrayIntoNegativesAndPositives: (NSArray *) splitting {
    
   //I'm going to need two mutable arrays for the 2 subarrays
    
    NSMutableArray *positiveInt = [[NSMutableArray alloc]init];
    NSMutableArray *negativeInt = [[NSMutableArray alloc]init];
    
   // NSArray *mainArray = @[];
    
    for(NSNumber *numbers in splitting){
        if([numbers integerValue] < 0) {
            [negativeInt addObject:numbers];
        } else if ([numbers integerValue] >= 0) {
            [positiveInt addObject:numbers];
        }
    }
    //unlike Ruby you don't need else
    //NSLog(@"%@", negativeInt);
    //NSLog(@"%@", positiveInt);
    
   // [[mainArray arrayByAddingObjectsFromArray:negativeInt] arrayByAddingObjectsFromArray:positiveInt];
    // NSLog(@"%@", mainArray);
    return @[negativeInt, positiveInt];
}


-(NSArray *) namesOfHobbitsInDictionary: (NSDictionary *) hobbits {
    
    NSMutableArray *listOfHobbits = [[NSMutableArray alloc] init];
    
    //'hobbits' returns name + whether or not human, elf, dwarf or human
    for (NSString *character in hobbits) {
        if([hobbits[character] isEqualToString:@"hobbit"]) {
            [listOfHobbits addObject:character];
        }
    }
    
    NSLog(@"%@", listOfHobbits);
    return listOfHobbits;
}

-(NSArray *) stringsBeginningWithAInArray: (NSArray *) stringsWithA {

    //try this with nspredicate later
    NSMutableArray *aWords = [[NSMutableArray alloc]init];
    
    for(NSString *word in stringsWithA) {
        NSString *lowercaseWord = [word lowercaseString];// store 'word' in a new string BC if I do [word lowerstring] in the if condition instead of what I'm doing here the 'A' will remain capitalized
        if([lowercaseWord hasPrefix:@"a"]){
            [aWords addObject:word];
        }
    }
    NSLog(@"%@", aWords);
    return aWords;
}

-(NSInteger) sumOfIntegersInArray: (NSArray *) intergersInArray {
    //can't use NSUInteger because it's not an object => NSNumber
    
    NSInteger sum = 0;
    for (NSNumber *num in intergersInArray)
    {
        sum += [num integerValue];
    }
    NSLog(@"%li", sum);
    return sum;
}


-(NSArray *) arrayByPluralizingStringsInArray: (NSArray *) pluralStrings {
   
    NSMutableArray *arrayOfPlurals = [[NSMutableArray alloc]init];
   
    NSString *pluralOfWord = @"";
    
    for (NSString *singularWord in pluralStrings) {
        if([singularWord containsString:@"oo"]) {
           pluralOfWord = [singularWord stringByReplacingOccurrencesOfString:@"oo" withString:@"ee"];
            
        } else if ([[singularWord substringFromIndex:[singularWord length]-2] containsString:@"us"]) {
             pluralOfWord = [singularWord stringByReplacingOccurrencesOfString:@"us" withString:@"i"];
            
        } else if ([[singularWord substringFromIndex:[singularWord length]-2] containsString:@"um"]) {
           pluralOfWord = [singularWord stringByReplacingOccurrencesOfString:@"um" withString:@"a"];
            
        } else if ([[singularWord substringFromIndex:[singularWord length]-1] containsString:@"d"]) {
          pluralOfWord = [singularWord stringByAppendingString:@"s"];
            
        } else if ([[singularWord substringFromIndex:[singularWord length]-1] containsString:@"e"]) {
            pluralOfWord = [singularWord stringByAppendingString:@"s"];
            
        } else if ([singularWord containsString:@"ox"]) {
           //STUDY NSPredicte, because idk how to use this shit ==> NSPredicate *oxWords = [NSPredicate predicateWithFormat:self LIKE '*ox*'"];
            if([singularWord hasPrefix:@"b"]) {
              pluralOfWord = [singularWord stringByAppendingString:@"es"];
            } else {
              pluralOfWord = [singularWord stringByAppendingString:@"en"];
            }
        }
         [arrayOfPlurals addObject:pluralOfWord];
    }
   
    NSLog(@"%@", arrayOfPlurals);
    return arrayOfPlurals;
}

-(NSDictionary *) countsOfWordsInString: (NSString *) string {
    
    //the key = the word in the story // the value = the # of occurences of the word
    
    // remove punctuations
    NSArray *punctuations = @[@".", @",", @"-", @";"];
    NSString *withoutPunctuation = [string copy];
   
    for (NSString *punctuation in punctuations) {
        withoutPunctuation = [withoutPunctuation stringByReplacingOccurrencesOfString:punctuation withString:@""];
    }
    
    //make all strings lowercase
    withoutPunctuation = [withoutPunctuation lowercaseString];
    NSArray *wordsInArray = [withoutPunctuation componentsSeparatedByString:@" "];
    
    NSMutableDictionary *countOfWords = [[NSMutableDictionary alloc]init];
    NSUInteger count = 0;
    
    for (NSString *words in wordsInArray) {
        if( [countOfWords[words] integerValue] > 0) {//delcares words as the key of the mutable dictionary that I declared
            count = [countOfWords[words] integerValue] + 1;
            countOfWords[words] = @(count);
        } else countOfWords[words] = @1;// go over this
    }
    
    
        //NSLog(@"%@", countOfWords);
    return [NSDictionary dictionaryWithDictionary:countOfWords];
}


-(NSDictionary *) songsGroupedByArtistFromArray: (NSArray *) array {
//dictionary of the alphabetized song names collected into arrays with their artist's name as the key"
    
    NSMutableDictionary *artistsWithSongs = [[NSMutableDictionary alloc] init];
    
      for (NSString *string in array) {
        NSArray *artistAndSong = [string componentsSeparatedByString:@" - "];
        NSString *song = artistAndSong[1];
        NSString *artist = artistAndSong[0];
      
        if ([[artistsWithSongs allKeys] containsObject:artist]) {// if the key of the dictionary matches artist than add 'song' as the value for key
                [artistsWithSongs[artist] addObject:song];
            }else {
                artistsWithSongs[artist] = [ @[song] mutableCopy];
                //NSLog(@"%@", artistsWithSongs[artist]);
            }
      }
    
    NSSortDescriptor *alphabetized = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    
    for (NSString *artist in artistsWithSongs){
        [artistsWithSongs[artist] sortUsingDescriptors:@[alphabetized]];
    }

        return [NSDictionary dictionaryWithDictionary:artistsWithSongs];
    }

    
//    for(NSString *artist in array) {
//       NSArray *artistAndSongs = [artist componentsSeparatedByString:@"-"];// this an array with the artist at index 0 and song at index 1
//        NSString *artists = artistAndSongs[0];
//        NSString *song = artistAndSongs[1];
//

@end

