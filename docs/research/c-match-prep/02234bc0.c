/* CAMPAIGN-PREP candidate for func_02234bc0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early-return guards; (1<<a)|(1<<b) shift-or; 1-bit0 via bitfield+rsb; field f1c/f0 add-order (acc-first)
 *   risk:       the double orr ...,ip lsl reg colors the shift operands into specific regs (orig: orr r2,r4,ip lsl r2 then orr r1,r2,ip lsl r0). mwcc's pick of which temp holds 1<<a vs the index is a shift-reg coin-flip. permuter-class.
 *   confidence: low
 */
/* func_ov002_02234bc0: gate on two bits of d016c+0xd0; tick 021e2b3c; build a
 * 2-bit mask from cd3f4 fields and send via 021de408; then 021df818(self,
 * 1-bit0, 800); tick 021e2c5c. Returns 0. */
typedef unsigned short u16;

struct Self { u16 f0; struct { u16 b0:1; u16 r:15; } f2; };
struct Cd3f4 { int f0; int f4; char _p8[0x14]; int f1c; int f20; };

extern int  func_ov002_021de408(void *self, int mask);
extern int  func_ov002_021df818(void *self, int v, int k);
extern void func_ov002_021e2b3c(void);
extern void func_ov002_021e2c5c(void);
extern int  data_ov002_022d016c[];
extern struct Cd3f4 data_ov002_022cd3f4;

int func_ov002_02234bc0(void *arg0) {
    struct Self *self = (struct Self *)arg0;
    struct Cd3f4 *p;
    unsigned int w, a, b, mask;
    w = *(unsigned int *)((char *)data_ov002_022d016c + 0xd0);
    if (w & 1) return 0;
    if (!((w >> 1) & 1)) return 0;
    func_ov002_021e2b3c();
    p = &data_ov002_022cd3f4;
    a = (unsigned)p->f1c + (unsigned)p->f0 * 16;
    b = (unsigned)p->f20 + (unsigned)p->f4 * 16;
    mask = (1u << a) | (1u << b);
    func_ov002_021de408(self, (int)mask);
    func_ov002_021df818(self, 1 - self->f2.b0, 800);
    func_ov002_021e2c5c();
    return 0;
}
