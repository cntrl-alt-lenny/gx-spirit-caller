/* CAMPAIGN-PREP candidate for func_021cd358 (ov003, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: branch-table on type for sz; flagA=(row!=0)?1:2 for movne/moveq; mla=0x48*type+base.
 *   risk:       struct-guessed/reshape-able: the 0xc0/0x180/0x200/0x300/0x380 table maps cases 0&1->0xc0 and default(>4) wraps; here case4 set to 0x380 but case-3-vs-default 0x300/0x380 split is ambiguous and 6-arg stack order may reorder.
 *   confidence: low
 */
/* func_ov003_021cd358: branch-table size select + mla/stack marshalling, one tail call.
 * sz: switch(type) {0,1->0xc0; 2->0x180; 3->0x200; 4->0x300; default(>4)->0x380}.
 * stride ip=type? no: ip = row(r1)*0x1b8. flagA=(row!=0)?1:2. a0..a5 layout below.
 * Calls _01ef90(base+0x320+row*0x1b8 + type*8  (r0),
 *   (r0+0x1a4)+row*0x1b8 + type*4 (r1),
 *   0x48*type + (r0+0x1b8)+row*0x1b8 (r2),
 *   sz<<7 (r3)) with 6 stacked words:
 *   sp+0:(type+1)<<9, sp+4:flagA, sp+8:arg3, sp+0xc:1, sp+0x10:0x200,
 *   sp+0x14:(r0+0x320+row*0x1b8)+type*8. */
extern void func_0201ef90(int, int, int, int, int, int, int, int, int, int);

void func_ov003_021cd358(int base, int row, int type, int arg3) {
    int sz;
    int stride = row * 0x1b8;
    int flagA;
    int slot;
    switch (type) {
    case 1: sz = 0xc0; break;
    case 2: sz = 0x180; break;
    case 3: sz = 0x200; break;
    case 4: sz = 0x380; break;
    default: sz = 0xc0; break;
    }
    if (type == 3) sz = 0x200;
    flagA = (row != 0) ? 1 : 2;
    slot = (base + 0x320 + stride) + type * 8;
    func_0201ef90(
        slot,
        ((base + 0x1a4) + stride) + type * 4,
        0x48 * type + ((base + 0x1b8) + stride),
        sz << 7,
        ((type + 1) << 9),
        flagA,
        arg3,
        1,
        0x200,
        slot);
}
