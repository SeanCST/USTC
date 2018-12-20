//
//  main.cpp
//  HUFFMAN
//
//  Created by SeanCST on 2018/12/12.
//  Copyright © 2018 NilOrg. All rights reserved.
//

#include <iostream>
#include <queue>
#include <algorithm>

using namespace std;

struct HuffNode {
    char c;
    int freq;
    HuffNode *left;
    HuffNode *right;
    
    HuffNode() {}
    
    HuffNode(int f, HuffNode *l, HuffNode *r, char ch = '\0') {
        freq = f;
        left = l;
        right = r;
        c = ch;
    }
    
    friend bool operator < (HuffNode a, HuffNode b)
    {
        return a.freq > b.freq;
    }
};
// 优先队列
priority_queue <HuffNode> q;

HuffNode HUFFMAN(vector<HuffNode> C) {
    unsigned long n = C.size();
    for (int i = 0; i < n; i++) {
        q.push(C[i]);
    }
    
    for (int i = 1; i <= n - 1; i++) {
        HuffNode z;
        
        HuffNode x = q.top();
        z.left = new HuffNode(x.freq, x.left, x.right, x.c);
        q.pop();
        
        HuffNode y = q.top();
        z.right = new HuffNode(y.freq, y.left, y.right, y.c);
        q.pop();
        
        z.freq = x.freq + y.freq;
        z.c = '\0';
        q.push(z);
    }
    
    return q.top();
}

void PrintHuff(HuffNode *r, vector<int> &code) {
    if (r->c != '\0') { // 遇到叶子结点则打印
        cout << r->c << " : ";
        // 打印编码
        for (int i = 0 ; i < code.size(); i++)
            cout << code[i];
    
        cout << endl;
    }
    if (r->left != NULL) { // 走左子树
        code.push_back(0);
        PrintHuff(r->left, code);
        code.pop_back();
    }
    if (r->right != NULL) { // 走右子树
        code.push_back(1);
        PrintHuff(r->right, code);
        code.pop_back();
    }
}

int main(int argc, const char * argv[]) {
    vector<HuffNode> C;
    
    HuffNode f = HuffNode(5, NULL, NULL, 'f');
    HuffNode e = HuffNode(9, NULL, NULL, 'e');
    HuffNode c = HuffNode(12, NULL, NULL, 'c');
    HuffNode b = HuffNode(13, NULL, NULL, 'b');
    HuffNode d = HuffNode(16, NULL, NULL, 'd');
    HuffNode a = HuffNode(45, NULL, NULL, 'a');
    C.push_back(f);
    C.push_back(e);
    C.push_back(c);
    C.push_back(d);
    C.push_back(b);
    C.push_back(a);

    HuffNode result = HUFFMAN(C);
    
    vector<int> code;
    PrintHuff(&result, code);
    
    return 0;
}
