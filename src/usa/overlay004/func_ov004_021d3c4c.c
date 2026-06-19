/* func_ov004_021d3c4c: play SE 232 then, per the flags, tear down the demo
 * stream (bit0) and/or the f228 records (bit1) — aborting if 02007230 is busy —
 * before flushing 021d8cd0. */
#include "ov004_core.h"
extern int func_0202c06c(int id);
extern void func_ov004_021d86ac(void *tag, int v, int n);
extern void *func_02032638(void);
extern void func_02032e70(void *ctx, void *p);
extern char data_02105a90[];
extern void func_0200886c(void);
extern int func_02007214(void);
extern void func_ov004_021d637c(int a);
extern void func_02009478(void *p);
extern void func_ov004_021d8be4(void *rec);
int func_ov004_021d3c4c(void *rec, int flags) {
    func_ov004_021d86ac(data_ov004_02291388, func_0202c06c(232), 1);
    if (flags & 1) {
        func_02032e70(func_02032638(), data_02105a90);
        func_0200886c();
        if (func_02007214() != 0) return -1;
    }
    if (flags & 2) {
        func_ov004_021d637c(0);
        func_02009478(data_ov004_0220efc8);
        *(int *)(data_ov004_0220e2a0 + 0xCD0) = 0;
        if (func_02007214() != 0) return -1;
    }
    func_ov004_021d8be4(data_ov004_02291388);
    return 0;
}
