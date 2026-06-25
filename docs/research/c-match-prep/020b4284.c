/* CAMPAIGN-PREP candidate for func_020b4284 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     ctor-table walk, blx indirect call, bottom-tested guard
 *   risk:       reg-alloc-walled — identical body already ships as src/main/func_020b4284.s (brief 302); the p!=0 base-null test + blx scheduling historically did not C-match
 *   confidence: low
 */
/* func_020b4284 (main, B) — C++ static-constructor walk over the ARM9 ctor table.
 * asm: r4 = &ARM9_CTOR_START; loop: while (r4 && (fn=*r4) != 0) { (*fn)(); r4++; }
 * The guard is tested at the bottom (b .L_14 first): cmp r4,#0; ldrne fn,[r4];
 * cmpne fn,#0; bne body — i.e. stop on null table base OR null entry. blx fn is
 * the indirect call (thumb/ARM interworking). */
extern void (*ARM9_CTOR_START[])(void);

void func_020b4284(void)
{
    void (**p)(void) = ARM9_CTOR_START;
    while (p != 0 && *p != 0) {
        (*p)();
        p++;
    }
}
