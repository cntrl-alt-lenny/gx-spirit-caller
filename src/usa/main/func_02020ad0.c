/* CAMPAIGN-PREP candidate for func_02020ad0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     store arg to field, guard call, struct callback blx
 *   risk:       r2(base)/r1(_LIT1) loaded before the str; arg order to func_0209e6fc is r0=0xe,r1=func,r2=0; the str r0,[r2,#0x1c] places arg store first; offsets guessed
 *   confidence: med
 */
extern unsigned char data_020c674c;
struct State {
    char pad0[0x1c];
    void *f1c;            /* 0x1c */
    char pad20[0x38-0x20];
    void (*f38)(void *);  /* 0x38 */
};
extern struct State data_02191e60;
extern void func_0201f0e4(int);
extern void func_02020344(void);
extern int func_0209e6fc(int a, void *b, int c);

void func_02020ad0(void *arg)
{
    data_02191e60.f1c = arg;
    if (func_0209e6fc(0xe, func_02020344, 0) == 0)
        return;
    func_0201f0e4(9);
    if (data_02191e60.f38 == 0)
        return;
    data_02191e60.f38(&data_020c674c);
    return;
}
