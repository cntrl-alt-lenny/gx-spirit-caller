/* CAMPAIGN-PREP candidate for func_021d7ee4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: Ov002Key extract; asym-shift packs (x<<22)>>16 & (kind<<27)>>26; rec re-read per use; if-assign flag6
 *   risk:       permuter-class: many lsl/lsr packs feeding r0-r3 of 021d479c => register-rotation/scheduling coin-flips likely; also mwcc may CSE the 3 rec extracts the orig reloads. Reshape (split exprs) may not pin the colouring.
 *   confidence: low
 */
/* func_ov002_021d7ee4 (ov002, cls D): big bitfield-pack body. Guard 021b9a30 on
 * Ov002Key a*2+b; build a 0x3f-kind 021d479c arg-pack (3 packed u16 payloads),
 * then a second 0202e2c8(rec->id) gate before a 021e278c post. arg2 is the record
 * ptr; rec re-read each use to mirror the orig's repeated ldr [r7]. */
typedef unsigned short u16;
typedef unsigned int   u32;

struct Ov002Key { u32 id : 13; u32 b : 1; u32 : 8; u32 a : 8; u32 : 2; };

extern char data_ov002_022cf178[];
extern int  func_ov002_021b9a30(int player, int key);
extern int  func_0202e2c8(int id);
extern int  func_ov002_021d479c(int p0, int p1, int p2, int p3);
extern int  func_ov002_021e278c(int arg0, int arg1);

int func_ov002_021d7ee4(int arg0, int arg1, void *arg2) {
    struct Ov002Key *rec = (struct Ov002Key *)arg2;
    u16 h;
    int flag6, r4, kind;
    if (func_ov002_021b9a30(arg1, rec->a * 2 + rec->b) < 0)
        return 0;
    h = *(u16 *)((char *)arg0 + 2);
    flag6 = ((h & 1) != arg1) ? 1 : 0;
    r4 = *(int *)(data_ov002_022cf178 + (arg1 & 1) * 0x868);
    kind = func_0202e2c8(rec->id) ? 0xc : 0xb;
    func_ov002_021d479c(0x3f,
        (u16)((arg1 & 1) | 0x1e | ((unsigned)((rec->a * 2 + rec->b) << 22) >> 16)),
        (u16)((arg1 & 1) | ((unsigned)(kind << 27) >> 26) | ((unsigned)(r4 << 22) >> 16)),
        (u16)flag6);
    if (func_0202e2c8(rec->id) != 0)
        return 1;
    func_ov002_021e278c((*(u16 *)((char *)arg0 + 2)) & 1, rec->a * 2 + rec->b);
    return 1;
}
