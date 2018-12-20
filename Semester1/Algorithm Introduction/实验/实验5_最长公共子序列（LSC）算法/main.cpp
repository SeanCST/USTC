//
//  main.cpp
//  LCS
//
//  Created by SeanCST on 2018/12/5.
//  Copyright © 2018 NilOrg. All rights reserved.
//

#include <iostream>
using namespace std;

typedef enum : int {
    DirectionLeft = 0,
    DirectionUp,
    DirectionLeftUp,
} Direction;

Direction** LCS_Length(string X, string Y) {
    unsigned long m = X.length();
    unsigned long n = Y.length();
    // 开辟动态二维数组
    // 保存子问题最优解
    Direction **b = new Direction*[m + 1];
    for (int i = 0; i <= m; i++)
        b[i] = new Direction[n];
    // 保存长度
    int **c = new int*[m + 1];
    for (int i = 0; i <= m; i++)
        c[i] = new int[n];
    
    // 初始化
    for (int i = 1; i <= m; i++)
        c[i][0] = 0;
    for (int j = 0; j <= n; j++)
        c[0][j] = 0;
    
    for (int i = 1; i <= m; i++) {
        for (int j = 1; j <= n; j++) {
            
            if(X[i - 1] == Y[j - 1]) {
                c[i][j] = c[i - 1][j - 1] + 1;
                b[i][j] = DirectionLeftUp;
            }
            
            else if(c[i - 1][j] >= c[i][j - 1]) {
                c[i][j] = c[i - 1][j];
                b[i][j]= DirectionUp;
            }
            
            else {
                c[i][j] = c[i][j - 1];
                b[i][j]= DirectionLeft;
            }
        }
    }
    
    cout << "输出构造的矩阵:" << endl;
    // 输出构造的矩阵
    for (int i = 0; i <= m; i++) {
        for (int j = 0; j <= n; j++) {
            if (i >= 1 && j >= 1) {
                switch (b[i][j]) {
                    case DirectionLeftUp:
                        cout << "↖";
                        break;
                    case DirectionUp:
                        cout << "↑";
                        break;
                    case DirectionLeft:
                        cout << "←";
                        break;
                    default:
                        cout << "N";
                        break;
                }
            }
            cout << c[i][j] << '\t';
        }
        cout << endl;
    }
    
    return b;
}

void Print_LCS(Direction **b, string X, unsigned long i, unsigned long j) {
    if (i == 0 || j == 0)
        return;
    if (b[i][j] == DirectionLeftUp) {
        Print_LCS(b, X, i - 1, j - 1);
        cout << X[i - 1] << '\t';
    }
    
    else if (b[i][j] == DirectionUp)
        Print_LCS(b, X, i - 1, j);
    
    else
        Print_LCS(b, X, i, j - 1);
}

int main(int argc, const char * argv[]) {
    // 输入
    string X, Y;
    cout << "输入序列 X：";
    cin >> X;
    cout << "输入序列 Y：";
    cin >> Y;
    
//    X = "ABCBDAB";
//    Y = "BDCABA";
    
    Direction **b = LCS_Length(X, Y);
    
    unsigned long m = X.length();
    unsigned long n = Y.length();
    cout << endl << "输出最长公共子序列：";
    Print_LCS(b, X, m, n);
    cout << endl << endl;
    
    return 0;
}
