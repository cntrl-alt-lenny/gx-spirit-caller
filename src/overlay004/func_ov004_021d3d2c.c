/* func_ov004_021d3d2c: play SE 232 then, per the flags, tear down the demo
 * stream (bit0) and/or the f228 records (bit1) — aborting if 02007230 is busy —
 * before flushing 021d8cd0. */
#include "ov004_core.h"
extern int func_0202c0c0(int id);
extern void func_ov004_021d8798(void *tag, int v, int n);
extern void *func_0203268c(void);
extern void func_02032ec4(void *ctx, void *p);
extern char data_02105b70[];
extern void func_02008888(void);
extern int func_02007230(void);
extern void func_ov004_021d6468(int a);
extern void func_02009494(void *p);
extern void func_ov004_021d8cd0(void *rec);
int func_ov004_021d3d2c(void *rec, int flags) {
    func_ov004_021d8798(data_ov004_022915e8, func_0202c0c0(232), 1);
    if (flags & 1) {
        func_02032ec4(func_0203268c(), data_02105b70);
        func_02008888();
        if (func_02007230() != 0) return -1;
    }
    if (flags & 2) {
        func_ov004_021d6468(0);
        func_02009494(data_ov004_0220f228);
        *(int *)(data_ov004_0220e500 + 0xCD0) = 0;
        if (func_02007230() != 0) return -1;
    }
    func_ov004_021d8cd0(data_ov004_022915e8);
    return 0;
}
