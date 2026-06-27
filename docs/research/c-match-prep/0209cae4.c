/* CAMPAIGN-PREP candidate for func_0209cae4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D store-order: base held in ip; reload-chain 0x24->0x20->0x1c exactly; mvn#0 for 0x28
 *   risk:       orig keeps base in ip (not r4) and threads r3=0 through stores; mwcc reg choice (r0/ip) and whether 0x20/0x1c are reloaded vs reuse-0 may shift. struct-guessed offsets; reload-order reshape-able, base-reg permuter-class.
 *   confidence: med
 */
/* func_0209cae4: one-shot init guard at 0x114, ordered field init, three setup calls. */

extern char *data_021a84c0;
extern char *data_021a8ae0;
extern char *data_021a8b00;
extern int  func_0209c0dc(void);
extern int  func_0209cacc(void);
extern void func_0209d664(void);

void func_0209cae4(void) {
    char *base = data_021a84c0;
    if (*(int *)(base + 0x114) != 0)
        return;
    *(int *)(base + 0x114) = 1;
    *(int *)(base + 0x24) = 0;
    *(int *)(base + 0x20) = *(int *)(base + 0x24);
    *(int *)(base + 0x1c) = *(int *)(base + 0x20);
    *(int *)(base + 0x28) = ~0x0;
    *(int *)(base + 0x38) = 0;
    *(int *)(base + 0x3c) = 0;
    *(int *)data_021a8ae0 = 0;
    func_0209c0dc();
    *(int *)data_021a8b00 = func_0209cacc();
    func_0209d664();
}
