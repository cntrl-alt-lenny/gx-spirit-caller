/* CAMPAIGN-PREP candidate for func_021c6d8c (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Linear call dispatch; first callee takes obj via still-live r0; store arg early.
 *   risk:       low-risk linear sequence; only likely diverge is whether mwcc keeps r0=obj live for the first call or re-moves it (mov r0,r4). reshape-able (any extra mov r0,r4 is benign/byte-identical anyway).
 *   confidence: med
 */
/* func_ov006_021c6d8c (ov006, D) - linear open/close dispatch. arg1 stored at
 * +0x3c; on open run 6 sub-inits + lazy-alloc + 0202227c; on close free + one
 * reset call. First sub-init uses r0=obj implicitly. Returns 1. */
extern char data_020fda40[];
extern int  func_020211c8(void *);
extern void func_020212cc(void);
extern void func_0202147c(void);
extern void func_0202227c(int a, void *p);
extern int  func_ov006_021c6e40(void *p, int a, int b);
extern int  func_ov006_021c6fa0(void *p, int a);
extern int  func_ov006_021c6ff8(void *p);
extern int  func_ov006_021c7110(void *p);
extern int  func_ov006_021c71e0(void *p, int a);
extern int  func_ov006_021c72c8(void *p);
extern int  func_ov006_021c74e0(void *p);

struct Ov006Obj6d8c {
    int  f_0;
    char pad4[0x38 - 0x4];
    int  f_38, f_3c;
    char pad40[0x58 - 0x40];
    int  f_58;
};

int func_ov006_021c6d8c(struct Ov006Obj6d8c *obj, int arg1) {
    obj->f_3c = arg1;
    if (arg1 != 0) {
        func_ov006_021c6ff8(obj);
        func_ov006_021c7110(obj);
        func_ov006_021c72c8(obj);
        func_ov006_021c71e0(obj, 0);
        func_ov006_021c6fa0(obj, 1);
        func_ov006_021c74e0(obj);
        if (obj->f_0 == 0) {
            obj->f_0 = func_020211c8(data_020fda40);
            func_0202147c();
            func_ov006_021c6e40(obj, obj->f_38, 1);
        }
        func_0202227c(0, &obj->f_58);
    } else {
        if (obj->f_0 != 0) {
            func_020212cc();
            obj->f_0 = 0;
        }
        func_ov006_021c6fa0(obj, 0);
    }
    return 1;
}
