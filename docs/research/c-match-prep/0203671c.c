/* CAMPAIGN-PREP candidate for func_0203671c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     STORE-ORDER struct init (store stream matches) + flag RMW on f68
 *   risk:       Scheduler near-match: identical insns/regs but 2 constant-movs (#0x40,#0x7f) parked one store-slot late -> 4-word swap; store order locked, source reorder cannot fix -> permuter/objdiff lane.
 *   confidence: med
 */
extern int func_020385bc(void *dst, int n);

struct S671c {
    int  f00;       /* 0x00 */
    int  f04;
    int  f08;       /* 0x08 */
    char fc[0x18-0x0c];
    short f18;       /* 0x18 */
    short f1a;
    short f1c;
    short f1e;       /* 0x1e */
    char f20;
    char f21;
    short f22;       /* 0x22 */
    char f24;
    char f25;
    char f26;
    char f27;
    char f28;
    char f29;
    char f2a;
    char f2b;        /* 0x2b */
    char pad2c[0x34-0x2c];
    int  f34;        /* 0x34 */
    int  f38;        /* 0x38 */
    char pad3c[0x40-0x3c];
    char f40[0x58-0x40];
    short f58;        /* 0x58 */
    char pad5a[0x5c-0x5a];
    int  f5c;        /* 0x5c */
    char pad60[0x68-0x60];
    unsigned short f68;  /* 0x68 */
    char pad6a[0x72-0x6a];
    char f72;
    char f73;
    short f74;        /* 0x74 */
};

void func_0203671c(struct S671c *p, int a, short b) {
    unsigned int old;
    unsigned int fl;
    p->f38 = 0;
    p->f00 = 0;
    func_020385bc((char *)p + 0x40, 0x7f);
    p->f34 = a;
    p->f74 = b;
    fl = 0x4000;
    old = p->f68;
    if (old & 0x2000)
        fl |= old & ~0x2000;
    else
        p->f5c = 0;
    p->f72 = 0;
    p->f58 = 0;
    p->f22 = -1;
    p->f1c = 0;
    p->f18 = 0;
    p->f1a = 0;
    p->f25 = 0x40;
    p->f24 = 0x40;
    func_020385bc((char *)p + 0xc, 0);
    p->f2a = 0;
    p->f29 = 0;
    p->f28 = 0x7f;
    p->f27 = 0x7f;
    p->f26 = 0x7f;
    p->f08 = 0;
    p->f20 = 0;
    p->f21 = 0;
    p->f1e = 1;
    p->f2b = 0;
    p->f73 = 0;
    p->f68 = fl;
}
