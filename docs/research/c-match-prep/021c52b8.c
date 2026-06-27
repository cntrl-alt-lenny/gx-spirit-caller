/* CAMPAIGN-PREP candidate for func_021c52b8 (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Store-order copy; bit0 RMW as (x&~1)|(v>6) for movgt;and;bic;orr.
 *   risk:       bit0 select: orig uses cmp#6;movgt;and#1;bic#1;orr. If mwcc reorders bic/orr or folds the ternary to movgt differently -> instr-order diverge. reshape-able (operand-order / keep & ~1 first).
 *   confidence: med
 */
/* func_ov006_021c52b8 (ov006, D) - per-mode field init + bit0 select.
 * obj->f_50=0; if(obj->f_54) copy 5 words from the global state's +c.. into its
 * own +6c.. ; else zero +4c/+6c/+70, set +74=gst->f_24c, set obj +78 bit0 =
 * (gst->f_24c > 6). Then lazy-alloc two surfaces and run 7 sub-init calls.
 * The bit0 RMW (movgt;and#1;bic#1;orr) is the class-D feature. */
struct Ov006GState {
    char pad0[0xc];
    int  f_c, f_10, f_14, f_18, f_1c;
    char pad20[0x6c - 0x20];
    int  f_6c;
    char pad70[0x8c - 0x70];
    int  f_8c, f_90, f_94, f_98;
    char pad9c[0x24c - 0x9c];
    int  f_24c;
};
extern struct Ov006GState data_ov006_0225dc14;
extern char data_020fdb90[];
extern char data_020fdd80[];
extern int  func_020211c8(void *);
extern void func_0202147c(void);
extern int  func_ov006_021c5cc0(void *);
extern int  func_ov006_021c5d00(void);
extern int  func_ov006_021c5f44(void *);
extern int  func_ov006_021c6454(void *);
extern int  func_ov006_021c669c(void *);
extern int  func_ov006_021c6798(void *);
extern int  func_ov006_021c6840(void *);

struct Ov006Obj {
    int  f_0, f_4;
    char pad8[0x4c - 0x8];
    int  f_4c, f_50, f_54;
    char pad58[0x6c - 0x58];
    int  f_6c, f_70, f_74, f_78;
};

int func_ov006_021c52b8(struct Ov006Obj *obj) {
    obj->f_50 = 0;
    if (obj->f_54 != 0) {
        struct Ov006GState *g = &data_ov006_0225dc14;
        g->f_6c = g->f_c;
        g->f_8c = g->f_10;
        g->f_90 = g->f_14;
        g->f_94 = g->f_18;
        g->f_98 = g->f_1c;
    } else {
        int v = data_ov006_0225dc14.f_24c;
        obj->f_4c = 0;
        obj->f_6c = 0;
        obj->f_70 = 0;
        obj->f_74 = v;
        obj->f_78 = (obj->f_78 & ~1) | (v > 6 ? 1 : 0);
    }
    if (obj->f_4 == 0) {
        obj->f_4 = func_020211c8(data_020fdb90);
        func_0202147c();
    }
    if (obj->f_0 == 0) {
        obj->f_0 = func_020211c8(data_020fdd80);
        func_0202147c();
    }
    func_ov006_021c5cc0(obj);
    func_ov006_021c5d00();
    func_ov006_021c5f44(obj);
    func_ov006_021c6454(obj);
    func_ov006_021c669c(obj);
    func_ov006_021c6798(obj);
    func_ov006_021c6840(obj);
    return 1;
}
