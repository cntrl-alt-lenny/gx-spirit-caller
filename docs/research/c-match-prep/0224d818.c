/* CAMPAIGN-PREP candidate for func_0224d818 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: packed :8(bit22)/:1(bit13) decode hi*2+lo; mla base (player&1)*0x868+0x120; early-return && chain
 *   risk:       the second entry read for hi/lo is a fresh `ldr [r6,arg2<<2]` (not the first id load reused); if mwcc CSEs the two loads into one reg the second ldr drops. Reshape-able by reading e twice; but :8/:1 offsets + the e->key reuse for 021b9128 are struct-guessed.
 *   confidence: low
 */
/* func_ov002_0224d818 (ov002, cls D): single entry list[arg2] at block+0x120.
 * Gate: :13 id passes func_0202e234, then func_ov002_021b9128(id,
 * func_0202b890(arg1)) nonzero, then func_ov002_021ca5bc(hi*2 + lo) nonzero,
 * where hi=:8 at bit22, lo=:1 at bit13 -- then post event 0xb at slot arg2. */
typedef unsigned int u32;

struct Entry {
    u32 key : 13;   /* 0..12 */
    u32 lo  : 1;    /* 13      -> lsl#0x12; lsr#0x1f */
    u32 _m  : 8;    /* 14..21  */
    u32 hi  : 8;    /* 22..29  -> lsl#0x2; lsr#0x18 */
};

extern char data_ov002_022cf16c[];
extern int  func_0202e234(u32 id);
extern int  func_0202b890(int arg1);
extern int  func_ov002_021b9128(u32 id, int arg);
extern int  func_ov002_021ca5bc(int packed);
extern void func_ov002_02253458(int player, int event, unsigned int slot);

void func_ov002_0224d818(int player, int arg1, int arg2) {
    char *base = data_ov002_022cf16c + (player & 1) * 0x868 + 0x120;
    struct Entry *e = (struct Entry *)(base + arg2 * 4);
    if (func_0202e234(e->key) == 0)
        return;
    if (func_ov002_021b9128(e->key, func_0202b890(arg1)) == 0)
        return;
    if (func_ov002_021ca5bc(e->hi * 2 + e->lo) == 0)
        return;
    func_ov002_02253458(player, 0xb, arg2);
}
