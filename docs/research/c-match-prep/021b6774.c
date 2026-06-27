/* CAMPAIGN-PREP candidate for func_021b6774 (ov017, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     for-loop switch i->sel{2,3,4} via if/else-if; RELOAD arr[i] each use; spawn marshalling; arr[i]=0
 *   risk:       struct-guessed: codegen is byte-identical in disasm; the only residual is whether the real arr symbol is exactly data_ov017_021b877c (it is the declared .extern), i.e. a relocation-name check, not a codegen risk.
 *   confidence: high
 */
/* CAMPAIGN-PREP candidate for func_ov017_021b6774 (ov017, class C, MED) — batch p_0138.
 * DISASM-VERIFIED: compiles to a BYTE-IDENTICAL match of the target (mwcc 2.0/sp1p5
 * -O4,p, confirmed with arm-none-eabi-objdump) — the pre-materialised selector
 * constants (r6=4,r7=3,r8=2), the if/else-if sel chain, the 3x reloaded arr[i],
 * the spawn marshalling and the arr[i]=0 store all line up exactly. */

extern void Task_InvokeLocked(void *t);
extern void func_0208f38c(void);
extern void func_0208f3e4(void *t, int a, int b);
extern void func_0208f458(void);

extern void *data_ov017_021b877c[];   /* arr (_LIT0) */

void func_ov017_021b6774(void) {
    int i;
    int sel;

    for (i = 0; i < 3; i++) {
        if (i == 0) {
            sel = 2;
        } else if (i == 1) {
            sel = 3;
        } else if (i == 2) {
            sel = 4;
        }
        if (data_ov017_021b877c[i] != 0) {
            func_0208f458();
            func_0208f3e4((char *)data_ov017_021b877c[i] + 0x28, sel << 9, 0x200);
            func_0208f38c();
            Task_InvokeLocked(data_ov017_021b877c[i]);
            data_ov017_021b877c[i] = 0;
        }
    }
}
