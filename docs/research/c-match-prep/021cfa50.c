/* CAMPAIGN-PREP candidate for func_021cfa50 (ov011, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload data_021d4000 each use; bind data_021d403c once (r4)
 *   risk:       two consecutive &= on +0x2a4 (~0x10 then ~0xf): mwcc may fold to one bic ~0x1f -> instruction-count diverges. reshape-able (keep as two statements / one combined mask to match)
 *   confidence: med
 */
/* func_ov011_021cfa50: linear teardown — AND/OR/BIC masked stores against a
 * global state block (data_021d4000) interleaved with subsystem calls, a
 * 2-way branch on field +0x2a0, an MMIO halfword poke at 0x04000008, and a
 * final BIC on a second block (data_021d403c)+0x260.
 * Orig RELOADS data_021d4000 (ldr _LIT0) before each touch; data_021d403c
 * is loaded once (r4) and held across the whole body. Mirror exactly. */
extern char data_ov011_021d4000[];
extern char data_ov011_021d403c[];
extern void func_ov011_021ca600(void);
extern void func_ov011_021cc3d4(void);
extern void func_ov011_021ccf3c(void);
extern void func_ov011_021cd638(void);

void func_ov011_021cfa50(void) {
    char *held = data_ov011_021d403c;          /* r4, held across calls */

    *(unsigned int *)(data_ov011_021d4000 + 0x2b0) &= 0xffe01fff;
    func_ov011_021cc3d4();
    func_ov011_021cd638();
    *(unsigned int *)(data_ov011_021d4000 + 0x2bc) |= 0x200;
    *(unsigned int *)(data_ov011_021d4000 + 0x2a4) &= ~0x10;
    *(unsigned int *)(data_ov011_021d4000 + 0x2a4) &= ~0xf;
    func_ov011_021ccf3c();
    *(unsigned int *)(data_ov011_021d4000 + 0x2ac) &= ~0x10000000;
    func_ov011_021ca600();
    if (*(int *)(data_ov011_021d4000 + 0x2a0) == 0) {
        unsigned short v = *(unsigned short *)0x04000008;
        v &= ~0x3;
        v |= 0x2;
        *(unsigned short *)0x04000008 = v;
    }
    *(unsigned int *)(held + 0x260) &= ~0x100000;
}
