//
//  main.cpp
//  RBTree
//
//  Created by 肖恩伟 on 2018/11/7.
//  Copyright © 2018 肖恩伟. All rights reserved.
//

#include "RB_Tree.h"
#include <vector>

int main(int argc, const char * argv[]) {
    
    vector<Interval> intervals;
    intervals.push_back(Interval(16, 21));
    intervals.push_back(Interval(8, 9));
    intervals.push_back(Interval(25, 30));
    intervals.push_back(Interval(5, 8));
    intervals.push_back(Interval(15, 23));
    intervals.push_back(Interval(17, 19));
    intervals.push_back(Interval(26, 26));
    intervals.push_back(Interval(0, 3));
    intervals.push_back(Interval(6, 10));
    intervals.push_back(Interval(19, 20));

    RB_Tree T;
    for (int i = 0; i < 10; i++) {
        
        TreeNode *z = new TreeNode(intervals[i]);
        T.RB_Insert(z);
//        cout << "插入 " << A[i] << " :" << endl;
        T.TreePrint();
        
        cout << endl;
    }
    
    // (11, 14) -> 空结点， (22, 25) -> (15, 23)
    Interval i = Interval(22, 25);
    TreeNode *find = T.IntervalSearch(i);
    // 打印
    cout << "打印找到的结点：";
    T.Print_Node(find);
    
    
    return 0;
}
