/* CAMPAIGN-PREP candidate for func_0200ade8 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-guard early-return + guarded-invoke + unrolled ldr/bl chain
 *   risk:       struct padding offsets guessed (only the listed offsets are load-bearing); field types void*
 *   confidence: high
 */
/* func_0200ade8 — null-guard then guarded-invoke pair + straight bl dispatch chain; returns 1. */

extern void Task_InvokeLocked(void *t);
extern void func_0200ae70(void *p);
extern void func_0200af08(void *p);
extern void func_0200af24(void *p);
extern void func_0200afc8(void *p);
extern void func_0200b06c(void *p);
extern void func_0200b0c8(void *p);
extern void func_0200b124(void *p);
extern void func_0200b140(void *p);
extern void func_0200b15c(void *p);
extern void func_0200b178(void *p);

typedef struct Obj {
    char  _p0[0x80];
    void *f80;                 /* 0x80 */
    char  _p1[0x88 - 0x84];
    void *f88;                 /* 0x88 */
    void *f8c;                 /* 0x8c */
    void *f90;                 /* 0x90 */
    void *f94;                 /* 0x94 */
    void *f98;                 /* 0x98 */
    char  _p2[0xa0 - 0x9c];
    void *fa0;                 /* 0xa0 */
    void *fa4;                 /* 0xa4 */
    void *fa8;                 /* 0xa8 */
    char  _p3[0x274 - 0xac];
    void *f274;                /* 0x274 */
    char  _p4[0x280 - 0x278];
    void *f280;                /* 0x280 */
} Obj;

int func_0200ade8(Obj *p)
{
    if (!p)
        return 0;
    if (p->f274) Task_InvokeLocked(p->f274);
    if (p->f280) Task_InvokeLocked(p->f280);
    func_0200ae70(p);
    func_0200af08(p->f80);
    func_0200af24(p->f90);
    func_0200afc8(p->f88);
    func_0200b06c(p->f98);
    func_0200b0c8(p->fa4);
    func_0200b124(p->f94);
    func_0200b140(p->f8c);
    func_0200b15c(p->fa0);
    func_0200b178(p->fa8);
    return 1;
}
