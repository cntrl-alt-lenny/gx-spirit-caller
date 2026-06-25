/* CAMPAIGN-PREP candidate for func_021fbd90 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     if-chain dispatch (phase==0/1/2); self->b0 from +2; counted loop unsigned bcc; reload count global each iter
 *   risk:       reshape-able: loop uses TWO live induction vars (r4 counter, r7=0 passed as i to 021d8128). Orig keeps r7=loop-arg2 separate from r4; if mwcc fuses them or hoists the +0xd44 load, the loop body diverges. May need an explicit second counter.
 *   confidence: low
 */
/* func_ov002_021fbd90 (ov002, class C) — 3-state dispatch on global phase (ce288+0x5b4),
 * state2 runs a counted loop over (d016c+0xd44) entries. self in r5 across the fn. */
typedef unsigned short u16;

extern char data_ov002_022ce288[];   /* phase scalar at +0x5b4 */
extern char data_ov002_022d016c[];   /* count at +0xd44 */
extern void func_ov002_021ae400(unsigned int bit0, int a);
extern void func_ov002_021af9d0(unsigned int bit0, int a, int f0, int z);
extern int  func_ov002_021b004c(int i1);
extern void func_ov002_021d8128(int bit0, int x, int i);
extern void func_ov002_021e2b3c(void);
extern void func_ov002_021e2c5c(void);

struct F021fbd90_Self { u16 f0; u16 b0 : 1; };

int func_ov002_021fbd90(struct F021fbd90_Self *self) {
    int phase = *(int *)(data_ov002_022ce288 + 0x5b4);
    if (phase == 0) {
        func_ov002_021ae400(self->b0, 0x56);
        *(int *)(data_ov002_022ce288 + 0x5b4) += 1;
        return 0;
    }
    if (phase == 1) {
        func_ov002_021af9d0(self->b0, 0x47, self->f0, 0);
        *(int *)(data_ov002_022ce288 + 0x5b4) += 1;
        return 0;
    }
    if (phase == 2) {
        int i;
        func_ov002_021e2b3c();
        for (i = 0; (unsigned)i < (unsigned)*(int *)(data_ov002_022d016c + 0xd44); i++) {
            func_ov002_021d8128(self->b0, func_ov002_021b004c(i + 1), i);
        }
        func_ov002_021e2c5c();
        self->f0 = (u16)*(int *)(data_ov002_022d016c + 0xd44);
        return 1;
    }
    return 1;
}
