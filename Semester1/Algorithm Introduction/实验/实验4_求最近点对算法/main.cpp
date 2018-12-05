//
//  main.cpp
//  最近点对
//
//  Created by SeanCST on 2018/11/27.
//  Copyright © 2018 肖恩伟. All rights reserved.
//

#include <iostream>
#include <cmath>
#include <float.h>
using namespace std;

struct Node {
    double x;
    double y;
};

Node P[10000], T[10000];

bool compXY(Node a, Node b) {
    if (a.x == b.x) {
        return a.y < b.y;
    }
    return a.x < b.x;
}

bool compY(Node a, Node b) {
    return a.y < b.y;
}

double dist(Node a, Node b) {
    return sqrt((a.x - b.x) * (a.x - b.x) + (a.y - b.y) * (a.y - b.y));
}

double closest(int left, int right) {
    double d = DBL_MAX;
    
    if (left == right)
        return d;
    if (left + 1 == right) // 若只有两个点，直接返回此二点之间的距离
        return dist(P[left], P[right]);
    
    int mid = (left + right) / 2;  // 中线
    double dl = closest(left, mid); // 递归计算中线左边的最近点
    double dr = closest(mid + 1, right); // 递归计算中线右边的最近点
    d = min(dl, dr); // 取左右区间内最小的距离
    
    int k = 0;
    // 取中线两边距中线距离小于等于 d 的所有点，并将这些点按 y 值排序
    for (int i = left; i <= right; i++) {
        if (fabs(P[i].x - P[mid].x) <= d) {
            T[k++] = P[i];
        }
    }
    sort(T, T + k, compY);
    
    // 取 y 轴内距离小于等于 d 的点，计算它们的距离，取最小值
    for (int i = 0; i < k; i++) {
        for (int j = i + 1; j < k && T[j].y - T[i].y < d; j++) {
            d = min(d, dist(T[i], T[j]));
        }
    }
    
    return d;
}

int main(int argc, const char * argv[]) {
    
    /*
     9.83 -81.96
     -88.29 44.76
     21.97 -81.49
     2.44 -1.83
     -89.17 63.58
     20 -49.92
     -81.21 -48.01
     -33.28 -49.09
     -54.05 12.88
     -64.85 -53.12
     12.07 64.91
     -72.9 -21.57
     12.93 -92.71
     -27.71 -0.19
     73.17 32.17
     */
    
    for(int i = 0; i < 15; i++)
        cin >> P[i].x >> P[i].y;
    
    sort(P, P + 15, compXY); //将所有点排序
    cout << closest(0,14) << endl;

    return 0;
}
