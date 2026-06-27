/* CAMPAIGN-PREP candidate for func_02020084 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     cmp-chain guard reusing loaded field, branch tails
 *   risk:       f30 must stay in r0 across both cmps (moveq/movne reuse r0); offset 0x30 guessed; load reused not reloaded
 *   confidence: high
 */
struct State { char pad[0x30]; int f30; };
extern struct State data_02191e60;
extern unsigned char data_02192200[];
extern void func_0201f0e4(int);
extern void func_0201f148(void);
extern int func_020a0510(void *p, int n);

int func_02020084(void)
{
    int s = data_02191e60.f30;
    if (s == 6)
        return 1;
    if (s != 4)
        return 0;
    func_0201f0e4(6);
    if (func_020a0510(data_02192200, 0xd) == 0)
        return 1;
    func_0201f148();
    return 0;
}
