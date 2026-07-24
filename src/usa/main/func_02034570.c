/* CAMPAIGN-PREP candidate for func_02034570 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     init zero-store order (30,34,3c,38) + return-value-chained setup calls; fn-ptr pool order
 *   risk:       first arg of each setup call assumed = prior call's return (chaining); literal-pool order depends on first-use sequence
 *   confidence: med
 */
/* func_02034570 — subsystem init: zero fields + chained setup calls */

typedef struct {
    unsigned char _pad_00[0x30];
    int f30;              /* +0x30 */
    int f34;              /* +0x34 */
    int f38;              /* +0x38 */
    int f3c;              /* +0x3c */
    unsigned char _pad_40[0x40 - 0x40];
} Obj_020345c0;

extern void func_02034124(Obj_020345c0 *p);
extern int  func_020343fc(Obj_020345c0 *p);
extern void func_02093b08(void);
extern int  func_020322fc(void);
extern int  func_02031e58(void);
extern int  func_02032638(void);
extern void func_0203231c(int a, void *cb1, void *cb2, int n);
extern void func_02032020(int a, void *cb1, void *cb2);
extern void func_02032fe4(int a, void *cb);
extern void func_02032f3c(int a, void *cb);
extern void func_02032fac(int a, void *cb);
extern void func_02032f58(int a, void *cb);
extern void func_02034704(void *dst, int n);
extern void func_0203454c(void);
extern void func_0203455c(void);
extern void func_02034160(void);
extern void func_020341e8(void);
extern void func_02034220(void);
extern void func_020342d0(void);

int func_02034570(Obj_020345c0 *p)
{
    func_02034124(p);
    p->f30 = 0;
    p->f34 = 0;
    p->f3c = 0;
    p->f38 = 0;
    if (func_020343fc(p) < 0) {
        func_02093b08();
        return -1;
    }
    func_0203231c(func_020322fc(), func_0203454c, func_0203455c, 0x800);
    func_02032020(func_02031e58(), func_0203454c, func_0203455c);
    func_02032fe4(func_02032638(), func_02034160);
    func_02032f3c(func_02032638(), func_020341e8);
    func_02032fac(func_02032638(), func_02034220);
    func_02032f58(func_02032638(), func_020342d0);
    func_02034704((char *)p + 0x40, 0x400);
    return 0;
}
