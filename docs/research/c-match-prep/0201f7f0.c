/* CAMPAIGN-PREP candidate for func_0201f7f0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     store-order field init, guard, branch tail
 *   risk:       arg order (r0=a,r1=b,r2=c) and movs vs mov on the f30!=1 path; many struct offsets guessed; store scheduling must stay in asm order
 *   confidence: med
 */
struct State {
    short f0;       /* 0x0 */
    short f2;       /* 0x2 */
    char pad4[0x28-0x4];
    void *f28;      /* 0x28 */
    char pad2c[0x30-0x2c];
    int f30;        /* 0x30 */
    char pad34[0x84-0x34];
    short f84;      /* 0x84 */
    short f86;
    short f88;      /* 0x88 */
    short f8a;      /* 0x8a */
    short f8c;      /* 0x8c */
};
extern struct State data_02191f40;
extern void func_0201f138(int);
extern int func_0201f874(void);
extern void func_02093bfc(void);

struct Src { unsigned short s0; unsigned short s2; unsigned short s4; };

int func_0201f7f0(void *a, struct Src *b, int c)
{
    if (data_02191f40.f30 != 1)
        func_02093bfc();
    func_0201f138(2);
    data_02191f40.f28 = a;
    data_02191f40.f2 = (short)c;
    data_02191f40.f84 = 0;
    data_02191f40.f0 = 0;
    data_02191f40.f8c = b->s4;
    data_02191f40.f8a = b->s2;
    data_02191f40.f88 = b->s0;
    if (func_0201f874() != 0)
        return 1;
    func_0201f138(9);
    return 0;
}
