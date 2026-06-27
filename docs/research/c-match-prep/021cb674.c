/* CAMPAIGN-PREP candidate for func_021cb674 (ov013, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     setter; func_02018b48()==4 branch; unsigned (x<<11)>>29 +1 3-bit field; bind data_021040ac
 *   risk:       HARD BLOCKER (unresolvable-call): first call is hand-encoded .word bl to 0x021b2198, reloc module:none/no symbol; mwcc's bl can't relocate -> likely stays .s unless func_021b2198 is defined
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov013_021cb674 (ov013, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED: MED tier rarely first-build-matches.
 *   recipe:     setter; func_02018b48()==4 branch; unsigned (x<<11)>>29 +1 3-bit field; bind data_021040ac base for the 0x3c/0x40 stores
 *   risk:       *** HARD BLOCKER: the first call is a hand-encoded `.word 0xebff9ac4` = bl 0x021b2198 with reloc module:none (no symbol). mwcc emits `bl func_021b2198` the linker cannot relocate -> this TU likely stays .s OR needs func_021b2198 defined as a symbol. Class: permuter-class/unresolvable-call.
 *   confidence: low
 */
/* func_ov013_021cb674 (ov013, class D): bl 0x021b2198(0) [hidden .word]; zero
 * data_021040ac[0x3c] and [0x40]; if func_02018b48()==4: func_02018e88(0,0xd8000,
 * 0xe4000); func_02019160(2); else if func_ov000_021ae4ac()!=0: D[0x3c]=((data_cbc3c
 * [0x168]<<11)>>29)+1; D[0x40]=func_ov000_021ae4ac(). finally func_ov013_021cb644(); return 1. */
extern char data_021040ac[];
extern char data_ov013_021cbc3c[];
extern void func_021b2198(int r0);           /* target of the hidden .word bl */
extern int func_02018b48(void);
extern void func_02018e88(int r0, int r1, int r2);
extern void func_02019160(int r0);
extern int func_ov000_021ae4ac(void);
extern void func_ov013_021cb644(void);

int func_ov013_021cb674(void) {
    char *D = data_021040ac;
    func_021b2198(0);
    *(int *)(D + 0x3c) = 0;
    *(int *)(D + 0x40) = 0;
    if (func_02018b48() == 4) {
        func_02018e88(0, 0xd8000, 0xe4000);
        func_02019160(2);
    } else if (func_ov000_021ae4ac() != 0) {
        *(int *)(D + 0x3c) =
            ((unsigned int)(*(int *)(data_ov013_021cbc3c + 0x168) << 11) >> 29) + 1;
        *(int *)(D + 0x40) = func_ov000_021ae4ac();
    }
    func_ov013_021cb644();
    return 1;
}
