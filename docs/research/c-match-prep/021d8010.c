/* CAMPAIGN-PREP candidate for func_021d8010 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: rsb invert r5=1-arg1; mixed pack bases (arg1&1 vs (1-arg1)&1); asym-shift packs; rec re-read
 *   risk:       permuter-class: same pack-rotation risk as 021d7ee4 plus the rsb (1-arg1) liveness — orig keeps r5=1-arg1 and r6=invp live across the 0202e2c8 call; mwcc may recompute or reallocate. 021c2eac arg2 type guessed (passed as int).
 *   confidence: low
 */
/* func_ov002_021d8010 (ov002, cls D): sibling of 021d7ee4 with rsb-inverted index
 * r5 = 1 - arg1. Guard 021c2eac; build a 0x3f-kind 021d479c arg-pack where p1 uses
 * base (arg1&1)|0x1c and p2 uses the inverted base (1-arg1)&1; then 0202e2c8 gate
 * + 021e278c(1-arg1, ...). rec re-read each use. */
typedef unsigned short u16;
typedef unsigned int   u32;

struct Ov002Key { u32 id : 13; u32 b : 1; u32 : 8; u32 a : 8; u32 : 2; };

extern char data_ov002_022cf178[];
extern int  func_ov002_021c2eac(int player, int arg1);
extern int  func_0202e2c8(int id);
extern int  func_ov002_021d479c(int p0, int p1, int p2, int p3);
extern int  func_ov002_021e278c(int arg0, int arg1);

int func_ov002_021d8010(int arg0, int arg1, void *arg2) {
    struct Ov002Key *rec = (struct Ov002Key *)arg2;
    int inv = 1 - arg1;
    int invp = inv & 1;
    u16 h;
    int flag7, r4, kind;
    if (func_ov002_021c2eac(arg1, (int)arg2) == 0)
        return 0;
    h = *(u16 *)((char *)arg0 + 2);
    flag7 = ((h & 1) != inv) ? 1 : 0;
    r4 = *(int *)(data_ov002_022cf178 + invp * 0x868);
    kind = func_0202e2c8(rec->id) ? 0xc : 0xb;
    func_ov002_021d479c(0x3f,
        (u16)((arg1 & 1) | 0x1c | ((unsigned)((rec->a * 2 + rec->b) << 22) >> 16)),
        (u16)(invp | ((unsigned)(kind << 27) >> 26) | ((unsigned)(r4 << 22) >> 16)),
        (u16)flag7);
    if (func_0202e2c8(rec->id) != 0)
        return 1;
    func_ov002_021e278c(inv, rec->a * 2 + rec->b);
    return 1;
}
