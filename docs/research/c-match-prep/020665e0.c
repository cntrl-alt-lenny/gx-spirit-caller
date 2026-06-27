/* CAMPAIGN-PREP candidate for func_020665e0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     signed %10 => smull 0x66666667 magic; search loop; reload cursor after store
 *   risk:       the magic requires `int` (signed) %10 — matches asr#2 + lsr#31 fixup in asm; risk is mwcc reloading [r0,#0x100] after store (asm does `str; ldr` again) vs reusing n. reshape-able by writing `*(tab+ *cur)=key` to force the reload.
 *   confidence: med
 */
/* func_020665e0: linear-search 10 dwords at +0xd8 for a key; on hit return 1.
 * On miss, advance a rolling cursor at +0x100 modulo 10 and store the key at
 * the new slot, returning 0. The (idx+1)%10 is the smull-by-0x66666667 magic. */

int func_020665e0(int base, int key)
{
    int *tab = (int *)(base + 0xd8);
    int *cur = (int *)(base + 0x100);
    int i;
    int n;

    for (i = 0; i < 10; i++) {
        if (key == tab[i]) return 1;
    }

    n = (*cur + 1) % 10;
    *cur = n;
    *(int *)(base + 0xd8 + n * 4) = key;
    return 0;
}
