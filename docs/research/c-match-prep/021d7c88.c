/* CAMPAIGN-PREP candidate for func_021d7c88 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: Ov002Key a*2+b bitfield extract; void early-returns; hold 0x1379 across extract
 *   risk:       reshape-able: the arg1<0 path is `ldmmi` with no mov r0 => declare void (an int return adds a moveq/mov r0); if a caller needs the result, type it int and bind. Else clean.
 *   confidence: med
 */
/* func_ov002_021d7c88 (ov002, cls D): guard arg1>=0, resolve slot via 021c93f0,
 * apply 021d7b44, then guard 021b3fd8(key0=0x1379, key1=Ov002Key a*2+b) before two
 * tail effects 021df6d4 / 021df938. The a*2+b extract is the shared Ov002Key idiom
 * ((w>>22)&0xff)*2 + ((w>>13)&1). LIT 0x1379 held in r2 across the extract. */
typedef unsigned int u32;

struct Ov002Key { u32 id : 13; u32 b : 1; u32 : 8; u32 a : 8; u32 : 2; };

extern void *func_ov002_021c93f0(int self, int kind, int idx);
extern void  func_ov002_021d7b44(int self, void *rec, int z);
extern int   func_ov002_021b3fd8(int player, int row, int key0, int key1);
extern void  func_ov002_021df6d4(int self, int v);
extern void  func_ov002_021df938(int self, int a, int b, int v);

void func_ov002_021d7c88(int self, int arg1) {
    struct Ov002Key *rec;
    if (arg1 < 0)
        return;
    rec = (struct Ov002Key *)func_ov002_021c93f0(self, 0xb, arg1);
    func_ov002_021d7b44(self, rec, 0);
    if (func_ov002_021b3fd8(self, 0xb, 0x1379, rec->a * 2 + rec->b) == 0)
        return;
    func_ov002_021df6d4(self, 0x1379);
    func_ov002_021df938(self, 0x7d0, 0, 0x1379);
}
