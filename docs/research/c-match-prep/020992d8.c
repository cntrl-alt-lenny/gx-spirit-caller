/* CAMPAIGN-PREP candidate for func_020992d8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     literal-pool template copy (ldmia/stmia) + on-stack fn-table + 6-arg call
 *   risk:       struct-guessed: the sp+0x1c descriptor layout, the 7-word template from data_0210268c, and the two interior `&(sp+N)` self-pointers are all inferred — offsets WILL need confirming. struct-guessed.
 *   confidence: low
 */
/* func_020992d8 (main, class C) — MD5 finalize descriptor build + dispatch.
 * Builds a large stack descriptor then calls f_02099718 with 4 reg args + 2
 * stacked. Layout on stack (sp-relative):
 *   +0x1c : 7 words copied from data_0210268c (a const template, ldmia 4+3)
 *   +0x24 : &(sp+0x38)        (work buffer ptr)
 *   +0x28 : &(sp+0x8)         (scratch ptr)
 *   +0x2c : &func_020996c8    (init fn)
 *   +0x30 : &func_0209956c    (update fn)
 *   +0x34 : &func_02099370    (final fn)
 *   [sp]  : incoming 5th arg (loaded from caller frame [sp+0xb8])
 *   [sp+4]: &(sp+0x1c)        (the descriptor base)
 * f_02099718(a0, a1, a2, a3, arg4, &desc). a0..a3 held in r8/r7/r6/r5. */

extern unsigned int data_0210268c[7];
extern void func_020996c8(void);
extern void func_0209956c(void);
extern void func_02099370(void);
extern void func_02099718(int a0, int a1, int a2, int a3, int arg4, void *desc);

typedef struct {
    unsigned int tmpl[7];   /* +0x1c..+0x38 from data_0210268c */
    void *work;             /* +0x38? -- this is &(sp+0x38) stored at +0x24 */
} Desc_020992d8;

void func_020992d8(int a0, int a1, int a2, int a3, int arg4) {
    unsigned int d[40];   /* sp+0x18 region; field stores below by index */
    /* d index = (byte off - 0x18)/4 */
    d[1]  = data_0210268c[0];   /* +0x1c */
    d[2]  = data_0210268c[1];   /* +0x20 */
    d[3]  = (unsigned int)&d[8];/* +0x24 = &(sp+0x38) */
    d[4]  = (unsigned int)&d[-2];/*+0x28 = &(sp+0x8) */
    d[5]  = (unsigned int)&func_020996c8; /* +0x2c */
    d[6]  = (unsigned int)&func_0209956c; /* +0x30 */
    d[7]  = (unsigned int)&func_02099370; /* +0x34 */
    d[2-2+1] = d[1]; /* keep template words live */
    func_02099718(a0, a1, a2, a3, arg4, &d[1]);
}
