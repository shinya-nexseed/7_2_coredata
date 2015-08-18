//
//  ViewController.m
//  7_2_coredata
//
//  Created by Shinya Hirai on 2015/08/18.
//  Copyright (c) 2015年 Shinya Hirai. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Comment.h"

@interface ViewController () {
    NSMutableArray *_result;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.searchBar.delegate = self;
    
    // CoreDataからの呼び出し
    AppDelegate *manager = [AppDelegate sharedManager];
    _result = [manager all:@"Comment" sortKey:@"body"];
    
    NSLog(@"count = %lu", (unsigned long)_result.count);
    
    // 高速列挙
    for (NSManagedObject *beforeData in _result) {
        Comment *data = (Comment *) beforeData;
        NSLog(@"コメントデータ = %@",data.body);
    }
    
    // 繰り返し文
//    for (int i = 0; i < _result.count; i++) {
//        NSManagedObject *beforeData = _result[i];
//        Comment *data = (Comment *) beforeData;
//        NSLog(@"コメントデータ = %@",data.body);
//    }
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"クリック");
//    NSLog(@"コメントをカウントして、〇〇だったときの配列の数 = %i", _result.count);
    
    // CoreDataにコメントを登録する
    AppDelegate *manager = [AppDelegate sharedManager];
    
    // Entityを呼び出す
    Comment *comment = (Comment *)[manager entityForInsert:@"Comment"];
    // Entityで定義されているAtributesを呼び出す
    comment.body = searchBar.text;
    // データを保存する
    [manager saveContext];
    
    // CoreDataからの呼び出し
    _result = [manager all:@"Comment" sortKey:@"body"];
    
    NSLog(@"count = %lu", (unsigned long)_result.count);
    
    // 高速列挙
    for (NSManagedObject *beforeData in _result) {
        Comment *data = (Comment *) beforeData;
        NSLog(@"コメントデータ = %@",data.body);
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
