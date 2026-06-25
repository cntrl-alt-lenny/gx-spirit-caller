/* CAMPAIGN-PREP candidate for func_020a6d54 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     arg-shuffle + variadic-call(desc,a0..a3) + tail call
 *   risk:       a3 must land as 1st stack arg (needs variadic callee); r4/lr/ip arg-save scheduling may differ
 *   confidence: med
 */
/* func_020a6d54 (main, class B) — fixed-arg wrapper that forwards its 4
 * args to a variadic formatter, prefixed with a literal output descriptor,
 * then calls a finaliser. r0..r2 forwarded in r1..r3, the 4th arg spilled
 * to [sp] as the first stack/variadic slot, descriptor in r0.
 *   recipe: arg-shuffle -> variadic call(&desc, a0..a3) + tail call
 */
extern char data_021027fc[];
extern void func_020a95e4(void *desc, ...);
extern void func_020a6b30(void);

void func_020a6d54(int a0, int a1, int a2, int a3)
{
    func_020a95e4(data_021027fc, a0, a1, a2, a3);
    func_020a6b30();
}
