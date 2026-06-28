/* CAMPAIGN-PREP candidate for func_02020b24 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     store arg to field, guard call, struct callback blx
 *   risk:       r2(base)/r1(_LIT1) loaded before the str; arg order to func_0209e7f0 is r0=0xe,r1=func,r2=0; the str r0,[r2,#0x1c] places arg store first; offsets guessed
 *   confidence: med
 */
extern unsigned char data_020c682c;
struct State {
    char pad0[0x1c];
    void *f1c;            /* 0x1c */
    char pad20[0x38-0x20];
    void (*f38)(void *);  /* 0x38 */
};
extern struct State data_02191f40;
extern void func_0201f138(int);
extern void func_02020398(void);
extern int func_0209e7f0(int a, void *b, int c);

void func_02020b24(void *arg)
{
    data_02191f40.f1c = arg;
    if (func_0209e7f0(0xe, func_02020398, 0) == 0)
        return;
    func_0201f138(9);
    if (data_02191f40.f38 == 0)
        return;
    data_02191f40.f38(&data_020c682c);
    return;
}
