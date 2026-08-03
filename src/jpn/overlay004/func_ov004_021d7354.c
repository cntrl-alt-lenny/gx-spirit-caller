#include "ov004_core.h"

extern int  func_0202c06c(int id);
extern void func_ov004_021d6e34(int a, int b, int c);
extern char data_02103fcc[];

void func_ov004_021d7354(int arg0) {
    char *base;
    int i;
    int t;
    int v;

    base = data_ov004_0220b2a0;

    if (arg0 < 0) {
        for (i = 0; i < 5; i++) {
            v = func_0202c06c(i + 0x3d4);
            func_ov004_021d6e34(i, v, 0x80);
        }
    }

    if (arg0 < 0 || arg0 == 0) {
        v = func_0202c06c(*(int *)(base + 0x3c94) + 0xd9 + 0x300);
        func_ov004_021d6e34(5, v, 0x80);
    }

    if (arg0 < 0 || arg0 == 1) {
        t = *(int *)(base + 0x3c98);
        if (t != 0) {
            v = 3;
        } else {
            v = *(int *)(data_02103fcc + 0x34);
        }
        v = func_0202c06c(v + 0xdb + 0x300);
        func_ov004_021d6e34(6, v, 0x80);
    }

    if (arg0 < 0 || arg0 == 2) {
        v = func_0202c06c(*(int *)(base + 0x3c9c) + 0xdf + 0x300);
        func_ov004_021d6e34(7, v, 0x80);
    }

    if (arg0 < 0 || arg0 == 3) {
        v = func_0202c06c(*(int *)(base + 0x3ca0) + 0xe1 + 0x300);
        func_ov004_021d6e34(8, v, 0x80);
    }
}
