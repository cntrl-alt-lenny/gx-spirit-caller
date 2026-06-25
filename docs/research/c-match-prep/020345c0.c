/* CAMPAIGN-PREP candidate for func_020345c0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     init zero-store order (30,34,3c,38) + return-value-chained setup calls; fn-ptr pool order
 *   risk:       first arg of each setup call assumed = prior call's return (chaining); literal-pool order depends on first-use sequence
 *   confidence: med
 */
/* func_020345c0 — subsystem init: zero fields + chained setup calls */

typedef struct {
    unsigned char _pad_00[0x30];
    int f30;              /* +0x30 */
    int f34;              /* +0x34 */
    int f38;              /* +0x38 */
    int f3c;              /* +0x3c */
    unsigned char _pad_40[0x40 - 0x40];
} Obj_020345c0;

extern void func_02034174(Obj_020345c0 *p);
extern int  func_0203444c(Obj_020345c0 *p);
extern void func_02093bfc(void);
extern int  func_02032350(void);
extern int  func_02031eac(void);
extern int  func_0203268c(void);
extern void func_02032370(int a, void *cb1, void *cb2, int n);
extern void func_02032074(int a, void *cb1, void *cb2);
extern void func_02033038(int a, void *cb);
extern void func_02032f90(int a, void *cb);
extern void func_02033000(int a, void *cb);
extern void func_02032fac(int a, void *cb);
extern void func_02034754(void *dst, int n);
extern void func_0203459c(void);
extern void func_020345ac(void);
extern void func_020341b0(void);
extern void func_02034238(void);
extern void func_02034270(void);
extern void func_02034320(void);

int func_020345c0(Obj_020345c0 *p)
{
    func_02034174(p);
    p->f30 = 0;
    p->f34 = 0;
    p->f3c = 0;
    p->f38 = 0;
    if (func_0203444c(p) < 0) {
        func_02093bfc();
        return -1;
    }
    func_02032370(func_02032350(), func_0203459c, func_020345ac, 0x800);
    func_02032074(func_02031eac(), func_0203459c, func_020345ac);
    func_02033038(func_0203268c(), func_020341b0);
    func_02032f90(func_0203268c(), func_02034238);
    func_02033000(func_0203268c(), func_02034270);
    func_02032fac(func_0203268c(), func_02034320);
    func_02034754((char *)p + 0x40, 0x400);
    return 0;
}
