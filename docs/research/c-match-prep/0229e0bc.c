/* CAMPAIGN-PREP candidate for func_0229e0bc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D bitfield: two separate halfword RMW at +0xa (stack-scratch idiom); count p->f_a4 reloaded each iter; arg1&1<<14
 *   risk:       orig roundtrips +0xa through sp between the 0x4000-insert and 0x8000-clear (two distinct halfword writes); a single combined mask would emit one strh not two. The lr>>0x11 = (arg1&1)<<14 insert is order-sensitive. permuter-class (stack-scratch halfword RMW) + struct-guessed
 *   confidence: low
 */
/* func_ov002_0229e0bc: over array of 8 entries (stride 0x14) at p, while
 * i < p->f_a4 (count, reloaded each iter): set entry bitfield +0xa bit14 to
 * (arg1 & 1) and clear bit15, then set entry->f_4 = 8. arg1 is u16-truncated;
 * only its low bit matters (lr = (arg1&1)<<31, inserted at 0x4000). */
extern void dummy_e0bc(void);

typedef struct {
    char            _pad00[0x4];
    short           f_04;
    char            _pad06[0x4];
    unsigned short  bit14 : 1;   /* +0x0a, mask 0x4000 sits at bit14 */
    unsigned short  bit15 : 1;
    char            _pad0c[0x8];
} Ent_e0bc;          /* size 0x14 */

void func_ov002_0229e0bc(void *base, int arg1) {
    Ent_e0bc *e;
    int i;
    unsigned short bit = (unsigned short)arg1 & 1;
    if (arg1 == 0) return;
    e = (Ent_e0bc *)base;
    for (i = 0; i < 8; i++, e++) {
        if (i >= *(int *)((char *)base + 0xa4)) continue;
        /* +0xa: insert bit at 0x4000 then clear 0x8000 -> two halfword RMW */
        { unsigned short h = *(unsigned short *)((char *)e + 0xa);
          h = (h & ~0x4000) | (bit << 14);
          *(unsigned short *)((char *)e + 0xa) = h;
          h = *(unsigned short *)((char *)e + 0xa);
          h = h & ~0x8000;
          *(unsigned short *)((char *)e + 0xa) = h; }
        e->f_04 = 8;
    }
}
