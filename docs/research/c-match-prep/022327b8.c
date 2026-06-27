/* CAMPAIGN-PREP candidate for func_022327b8 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     nested loop, shifted bit-test 1<<(col+sl), accumulate; sl+=0x10 per outer row
 *   risk:       reshape-able: orig precomputes the inner index (add r0,r7,sl) before the variable shift; if mwcc folds (1<<col)<<sl differently the shift reg-alloc diverges. permuter-class for the lsl reg pick.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_022327b8 (ov002, class D) - brief 494.
 * UNVERIFIED build-free draft. Nested loop: outer r6 0..1 (sl base += 0x10),
 * inner r7 0..4; tst mask, 1 << (r7 + sl); accumulate 021c848c(r6,r7) into acc.
 * Tail: 021df818(obj, 1 - (f2&1), acc). df818 mask from 02257704 + de408.
 */
typedef unsigned short u16;

extern int  func_ov002_021c848c(int r6, int r7);
extern int  func_ov002_021de408(char *obj);
extern void func_ov002_021df818(char *obj, int a, int acc);
extern int  func_ov002_021e2b3c(void);
extern int  func_ov002_021e2c5c(void);
extern int  func_ov002_02257704(void);

int func_ov002_022327b8(char *obj) {
    int acc = 0;
    int mask;
    int row, col, sl;
    u16 f2;

    func_ov002_021e2b3c();
    func_ov002_02257704();
    mask = func_ov002_021de408(obj);
    sl = 0;
    for (row = 0; row < 2; row++) {
        for (col = 0; col <= 4; col++) {
            if (mask & (1 << (col + sl)))
                acc += func_ov002_021c848c(row, col);
        }
        sl += 0x10;
    }
    f2 = *(u16 *)(obj + 2);
    func_ov002_021df818(obj, 1 - ((f2 << 0x1f) >> 0x1f), acc);
    func_ov002_021e2c5c();
    return 0;
}
