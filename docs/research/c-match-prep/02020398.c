/* CAMPAIGN-PREP candidate for func_02020398 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard, switch-on-field, struct callback blx with reordered args
 *   risk:       callback at 0x1c held in r3 across; arg marshalling r0=m12,r1=mc,r2=m10 ordering vs source; offsets 0xc/0x10/0x12 guessed
 *   confidence: low
 */
struct State { char pad[0x1c]; void (*f1c)(void *, int, int); };
extern struct State data_02191f40;
extern void func_0201f19c(void);

struct Msg {
    unsigned short m0;   /* 0x0 */
    unsigned short m2;   /* 0x2 */
    unsigned short m4;   /* 0x4 */
    char pad6[0xc-0x6];
    int mc;              /* 0xc */
    char padr[0x10-0x10];
    unsigned short m10;  /* 0x10 */
    unsigned short m12;  /* 0x12 */
};

void func_02020398(struct Msg *p)
{
    void (*cb)(unsigned int, int, int);
    if (p->m2 != 0) {
        func_0201f19c();
        return;
    }
    cb = (void (*)(unsigned int, int, int))data_02191f40.f1c;
    if (cb == 0)
        return;
    if (p->m4 == 0x15) {
        cb(p->m12, p->m10, p->mc);
        return;
    }
    if (p->m4 != 0x9)
        return;
    cb(p->m12, 0, 0);
    return;
}
