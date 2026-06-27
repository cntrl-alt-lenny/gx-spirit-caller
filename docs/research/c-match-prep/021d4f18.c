/* CAMPAIGN-PREP candidate for func_021d4f18 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     asymmetric-shift bit2 raw; re-read count each iter; state dispatch
 *   risk:       struct-guessed/incomplete: batch asm TRUNCATED — states 1/2/default + .L_d4 tail absent and the 4 literal-pool bases are inferred from offsets. Body cannot byte-match until refilled from full disasm.
 *   confidence: low
 */
/* func_ov002_021d4f18: ov002 state-dispatch + counted compaction loop (cls C).
 * WARNING: the batch asm is TRUNCATED at 484 bytes (~121 insns); the JSON cuts
 * off inside the state==0 path right after the 021b1570 post + a +0x300 reload.
 * The state==1 (.L_140), state==2 (.L_168), default (.L_1c8) and the .L_d4
 * tail (past 021b1570, incl .L_120) are ABSENT from the batch. Literal-pool
 * values are inferred from the offsets: _LIT0=cd968 (+0xd0c/+0xd88),
 * _LIT1=ce958 (+0x300), _LIT2=ce950 (+0x808/+0x80c), _LIT3=d016c. This TU
 * encodes only the visible prefix and is a SCAFFOLD — fill the tail from the
 * full disasm before expecting a byte match. */
#include "ov002_core.h"

extern char data_ov002_022cd968[];   /* _LIT0: +0xd0c gate, +0xd88 state */
extern char data_ov002_022ce958[];   /* _LIT1: +0x300 flag word         */
/* data_ov002_022ce950 (_LIT2) and data_ov002_022d016c (_LIT3) from core.h */

extern int  func_ov002_0229c7f8(int a);
extern int  func_ov002_0229cd70(char *dst, char *src, int n);
extern void func_ov002_021d4e10(void);

int func_ov002_021d4f18(void) {
    int i;
    if (func_ov002_0229c7f8(0) != 0)
        return 1;
    if (*(int *)(data_ov002_022cd968 + 0xd0c) != 0 &&
        ((unsigned)(*(int *)(data_ov002_022ce958 + 0x300) << 29) >> 31) != 0) {
        func_ov002_021d4e10();
        return 0;
    }
    if (*(int *)(data_ov002_022cd968 + 0xd88) == 0) {
        if (*(int *)(data_ov002_022ce950 + 0x808) == 0)
            return 0;
        func_ov002_0229cd70(data_ov002_022ce950, data_ov002_022d016c, 8);
        *(int *)(data_ov002_022ce950 + 0x808) -= 1;
        if (*(int *)(data_ov002_022ce950 + 0x808) != 0) {
            for (i = 0; i < *(int *)(data_ov002_022ce950 + 0x808); i++)
                func_ov002_0229cd70(data_ov002_022d016c + i * 8,
                                    data_ov002_022d016c + (i + 1) * 8, 8);
        }
        *(int *)(data_ov002_022ce958 + 0x300) |= 8;
        *(int *)(data_ov002_022ce950 + 0x80c) = 1;
        if (*(int *)(data_ov002_022cd968 + 0xd0c) != 0) {
            func_ov002_021b1570(7, -1, (u16 *)0, 8);
            /* TRUNCATED past here: reload +0x300, remainder of .L_d4 absent. */
        }
        /* TRUNCATED: .L_120 (the else of the +0xd0c gate) absent. */
    }
    /* TRUNCATED: state==1 (.L_140), ==2 (.L_168), default (.L_1c8) absent. */
    return 0;
}
