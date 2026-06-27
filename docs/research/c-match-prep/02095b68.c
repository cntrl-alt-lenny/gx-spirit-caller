/* CAMPAIGN-PREP candidate for func_02095b68 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla idx*0xC+base table; tag guard; blx callback; bind base in r3 (class C)
 *   risk:       struct-guessed: stride 0xC and field offsets (fn@0, arg@4, tag@8) inferred from `mla r3,r2,#0xc` + ldr/ldrb offsets -- confirm Entry021a8220 layout. Also blx forces sub sp,#4 spill; only `blx` (fn ptr, ARM) matches, not a `bl`.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_02095b68 (main, class C) — MED tier.
 * UNVERIFIED build-free draft.
 *   recipe:  mla index into 0xC-stride table; tag-match guard; blx callback
 *   class C: mla (idx*12 + base) addressing; sub sp,#4 is the blx spill slot
 * struct-guessed: data_021a8220 = {u32 fn; u32 arg; u8 tag;} stride 0xC (matches 02095c18).
 */
/* func_02095b68: e = &data_021a8220[r0 & 0xff]; if (((r0>>8)&0xff) != e->tag)
 * return; if (e->fn == 0) return; e->fn(e->arg);  (indirect call via blx). */

typedef struct {
    void (*fn)(int arg);
    int  arg;
    unsigned char tag;
} Entry021a8220;

extern Entry021a8220 data_021a8220[];

void func_02095b68(int code)
{
    Entry021a8220 *e = &data_021a8220[code & 0xff];

    if (((code >> 8) & 0xff) != e->tag)
        return;
    if (e->fn == 0)
        return;
    e->fn(e->arg);
}
