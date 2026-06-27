/* CAMPAIGN-PREP candidate for func_02095de0 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     irq-locked indexed load; offset>=0x2000000 kept, else base+off; bind result r4 (class C)
 *   risk:       threshold `cmp r4,#0x2000000` + `addcc` means UNSIGNED compare and value kept when >=0x2000000; if mwcc signed-compares or restructures the if/else-if the addcc/b layout diverges. result must survive in r4 across func_020952d0. reshape-able (unsigned cast, explicit temp).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02095de0 (main, class C) — MED tier.
 * UNVERIFIED build-free draft.
 *   recipe:  IRQ-locked indexed load; offset-vs-pointer fixup via threshold cmp
 *   class C: bind r5=base,r4=idx across the disable/restore pair; sub sp,#4 slot
 * struct-guessed: element stride 4, field @0x3c holds either 0, a <0x2000000 rel offset, or abs ptr.
 */
/* func_02095de0: r5=base, r4=idx.
 *   func_020952e4();                          (disable irq)
 *   v = *(int*)(base + idx*4 + 0x3c);
 *   if (v == 0) r = 0;
 *   else if (v < 0x2000000) r = base + v;     (relocate relative offset)
 *   else r = v;                               (already absolute ptr)
 *   func_020952d0();                          (restore irq)
 *   return r;
 * The do-disable/load/restore brackets force the result to be held in r4
 * across func_020952d0; sub sp,#4 is the dead slot (legacy_sp3 candidate). */

extern void func_020952d0(void);
extern void func_020952e4(void);

int func_02095de0(int base, int idx)
{
    int v;

    func_020952e4();
    v = *(int *)(base + idx * 4 + 0x3c);
    if (v == 0)
        v = 0;
    else if ((unsigned int)v < 0x2000000)
        v = base + v;
    func_020952d0();
    return v;
}
