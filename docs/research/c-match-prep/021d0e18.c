/* CAMPAIGN-PREP candidate for func_021d0e18 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order h2,h6,h4 = load-order; stack temp for *rec; if-assign branch on h6; flag held in r5 across calls
 *   risk:       permuter-class: the hi-byte extract `(u16(r)>>8)&0xff` (lsl#16;lsr#16;asr#8;and) and r0-vs-r2 decode of r (lo/hi16) are scheduling/reg-rotation around blx-returns; the `&0xff` after lsr#10 may pick a different reg than orig.
 *   confidence: low
 */
/* func_ov002_021d0e18: query 021b947c(h4), and if its result's hi-byte (of the
 * low 16) equals h2, decode the result into (lo byte, hi byte, hi 16), feed the
 * record from 021c93f0 to 021ba430 via a stack temp, branch on h6 to
 * 021ba1a0/021ba11c, then post a 0x14 event. flag = ce950 sign bit. */

extern char data_ov002_022ce950[];
extern int  func_ov002_021b947c(int a);
extern void func_ov002_021ba11c(int a, int *p);
extern void func_ov002_021ba1a0(int a, int *p);
extern void func_ov002_021ba430(int a, int *p);
extern int *func_ov002_021c93f0(int lo, int hi, int hi16);
extern int  func_ov002_0229ade0(int cmd, int a, int b, int c);

void func_ov002_021d0e18(void) {
    int local;
    int flag = (*(unsigned short *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    unsigned short h2 = *(unsigned short *)(data_ov002_022ce950 + 2);
    unsigned short h6 = *(unsigned short *)(data_ov002_022ce950 + 6);
    unsigned short h4 = *(unsigned short *)(data_ov002_022ce950 + 4);
    int r = func_ov002_021b947c(h4);
    int hi = ((unsigned int)(unsigned short)r >> 8) & 0xff;
    int *rec;

    if (hi != h2) {
        *(int *)(data_ov002_022ce950 + 0x80c) = 0;
        return;
    }
    rec = func_ov002_021c93f0(r & 0xff, hi, (unsigned short)(r >> 16));
    local = *rec;
    func_ov002_021ba430(flag, &local);
    if (h6 != 0)
        func_ov002_021ba1a0(flag, &local);
    else
        func_ov002_021ba11c(flag, &local);
    func_ov002_0229ade0(0x14, flag, 0xd, 0);
    *(int *)(data_ov002_022ce950 + 0x80c) = 0;
}
