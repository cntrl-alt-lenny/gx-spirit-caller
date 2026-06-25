/* CAMPAIGN-PREP candidate for func_02020130 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard, call, moveq/movne boolean tail
 *   risk:       final moveq r0,#0/movne r0,#1 expects !=0 boolean from func_02020188; offset 0x30 guessed
 *   confidence: high
 */
struct State { char pad[0x30]; int f30; };
extern struct State data_02191f40;
extern unsigned char data_021922e0[];
extern void func_0201f138(int);
extern void func_0201f19c(void);
extern int func_02020188(void);
extern int func_020a05f8(void *p);

int func_02020130(void)
{
    if (data_02191f40.f30 != 6)
        return 0;
    func_0201f138(3);
    if (func_020a05f8(data_021922e0) != 0) {
        func_0201f19c();
        return 0;
    }
    return func_02020188() != 0;
}
