/* CAMPAIGN-PREP candidate for func_021c6a58 (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Paired MMIO RMW in exact store order; reload reg after each strh.
 *   risk:       4 RMW halfword stores to +0/+2 must keep the orig ldrh/strh interleave; mwcc may CSE the two reg[0] reads or reorder reg[0]/reg[1]. reshape-able (separate reads per RMW, keep store order).
 *   confidence: med
 */
/* func_ov006_021c6a58 (ov006, D) - enable/disable handler with paired MMIO
 * RMW (store-order sensitive). On enable (arg1!=0): configure regs +0/+2 at
 * 0x0400000c, lazy-alloc, arm. On disable: free if live. Returns 1. */
extern char data_020fb840[];
extern int  func_020211c8(void *);
extern void func_020212cc(void);
extern void func_0202147c(void);
extern void func_0202227c(int a, void *p);
extern void func_0202c948(int a, int b);
extern void func_0202c9c0(int a);
extern int  func_ov006_021c6b34(void *p, int a, int b);

struct Ov006Obj6a58 {
    int  f_0, f_4, f_8;
    char pad_c[0x14 - 0xc];
    int  f_14;
    char pad18[0x18 - 0x18];
    int  f_18;
};

int func_ov006_021c6a58(struct Ov006Obj6a58 *obj, int arg1) {
    obj->f_8 = arg1;
    obj->f_14 = 1;
    if (obj->f_8 != 0) {
        volatile unsigned short *reg = (volatile unsigned short *)0x0400000c;
        reg[0] = reg[0] & ~3;
        reg[0] = (reg[0] & 0x43) | 0xe00;
        reg[1] = reg[1] & ~3;
        reg[1] = (reg[1] & 0x43) | 0xf00;
        if (obj->f_0 == 0) {
            obj->f_0 = func_020211c8(data_020fb840);
            func_0202147c();
            func_ov006_021c6b34(obj, obj->f_4, 1);
        }
        func_0202227c(0x29, &obj->f_18);
        func_0202c948(2, 3);
    } else if (obj->f_0 != 0) {
        func_020212cc();
        obj->f_0 = 0;
    }
    func_0202c9c0(obj->f_8);
    return 1;
}
