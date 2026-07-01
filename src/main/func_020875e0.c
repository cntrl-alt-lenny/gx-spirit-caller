/* CAMPAIGN-PREP candidate for func_020875e0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     Cache args (incl. loaded-once field); twin guards on same value; store byte; tail call
 *   risk:       Struct offsets guessed (f4@4,f3d@3d); old-value kept in callee-saved r4 across calls may re-load
 *   confidence: med
 */
/* func_020875e0: cache args (r6=p, r5=flag, r4=p->f4). If p->f4 != 0,
 * detach it: func_0207cff4(p->f4, p) then p->f4 = 0. Always:
 * func_0207cff4(data_021a4868, p); store flag byte at p->f3d. If the old
 * p->f4 was non-zero, func_02087824(old_f4, p). Tail: func_020877c8(p).
 * r4 holds the ORIGINAL p->f4 across both guards (loaded once, up top).
 */

struct Func020875e0Obj {
    char _pad00[0x4];
    void *f4;
    char _pad08[0x35];
    unsigned char f3d;
};

extern char data_021a4868[];
extern void func_0207cff4(void *a, void *p);
extern void func_020877c8(void *p);
extern void func_02087824(void *a, void *p);

void func_020875e0(struct Func020875e0Obj *p, int flag) {
    void *old = p->f4;
    if (old != 0) {
        func_0207cff4(old, p);
        p->f4 = 0;
    }
    func_0207cff4(data_021a4868, p);
    p->f3d = (unsigned char)flag;
    if (old != 0) {
        func_02087824(old, p);
    }
    func_020877c8(p);
}
