//
//  main.cpp
//  RBTree
//
//  Created by 肖恩伟 on 2018/11/7.
//  Copyright © 2018 肖恩伟. All rights reserved.
//

#include "RB_Tree.h"

int main(int argc, const char * argv[]) {
    
    int A[6] = {41, 38, 31, 12, 19, 8};
    RB_Tree T;
    for (int i = 0; i < 6; i++) {
        TreeNode *z = new TreeNode(A[i]);
        T.RB_Insert(z);
        cout << "插入 " << A[i] << " :" << endl;
        T.TreePrint();
        
        cout << endl;
    }
    
    return 0;
}
