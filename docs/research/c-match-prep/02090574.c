/* CAMPAIGN-PREP candidate for func_02090574 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     BIND base + two absolute 32-bit-literal stores (store-order)
 *   risk:       Second store's 0x400 folds to an immediate (str [.,#-0x400]) instead of the orig's register offset [.,-r1]; literal pool order; the data_back_stride extern is a guess to force the register — may be unneeded/wrong. Low.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02090574 (main, class A).
 * recipe:  two absolute-address stores of 32-bit literals to a bound base
 *          (data_027e0000), expressed as base+0x3000 and base+0x3f80 views.
 * The orig keeps `add base,#0x3000`+`str [.,#0xf7c]` (a struct-base+field) and
 * `add base,#0x3f80`+`str [.,-r1]` (a base minus a register-held 0x400). The
 * 0x400 is loaded into a register (not folded), so it must stay opaque.
 */
extern char data_027e0000[];

/* 0x400 forced into a register so the second store uses [base,-r1] not a
 * folded immediate. Marked extern-volatile-ish via a global to defeat const-fold. */
extern unsigned int data_back_stride; /* = 0x400; placeholder for the register-held delta */

void func_02090574(void) {
    char *base = data_027e0000;
    *(unsigned int *)(base + 0x3000 + 0xf7c) = 0xfddb597d;
    *(unsigned int *)(base + 0x3f80 - 0x400) = 0x7bf9dd5b;
}
