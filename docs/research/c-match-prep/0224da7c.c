/* CAMPAIGN-PREP candidate for func_0224da7c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: packed :8(bit22)/:1(bit13) decode hi*2+lo; mla base +0x120; two-step early-return chain; arg2 indexes the word
 *   risk:       LIT2 (0x12ec) sits in the pool but isn't used by the listed body -> a 3rd reloc/global may be missing from this slice; also the entry is reloaded (2nd ldr) for hi/lo. struct-guessed (the :8/:1 offsets) + possibly-incomplete asm.
 *   confidence: low
 */
/* func_ov002_0224da7c (ov002, cls D): single entry list[arg2] at block+0x120.
 * Gate: :13 id passes func_0202df78, then func_ov002_021ca5bc(hi*2 + lo)
 * nonzero (hi=:8 at bit22, lo=:1 at bit13) -- then post event 0xb at slot
 * arg2. Like d818 minus the 021b9128 step. */
typedef unsigned int u32;

struct Entry {
    u32 key : 13;   /* 0..12 */
    u32 lo  : 1;    /* 13      -> lsl#0x12; lsr#0x1f */
    u32 _m  : 8;    /* 14..21  */
    u32 hi  : 8;    /* 22..29  -> lsl#0x2; lsr#0x18 */
};

extern char data_ov002_022cf16c[];
extern int  func_0202df78(u32 id);
extern int  func_ov002_021ca5bc(int packed);
extern void func_ov002_02253458(int player, int event, unsigned int slot);

void func_ov002_0224da7c(int player, int arg1, int arg2) {
    char *base = data_ov002_022cf16c + (player & 1) * 0x868 + 0x120;
    struct Entry *e = (struct Entry *)(base + arg2 * 4);
    if (func_0202df78(e->key) == 0)
        return;
    if (func_ov002_021ca5bc(e->hi * 2 + e->lo) == 0)
        return;
    func_ov002_02253458(player, 0xb, arg2);
}
