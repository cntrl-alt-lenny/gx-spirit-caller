/* CAMPAIGN-PREP candidate for func_02213064 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: descending case order; (1-bit0) via rsb reloaded each call (calls are barriers); t,u bound; `t>0 && u>=0` short-circuit -> ble/blt.
 *   risk:       struct-guessed: 021e06e4 3-arg (no r3) and 021d5c50 4-arg here (vs 2-arg elsewhere) — confirm sigs. Codegen byte-verified incl. 5x bit0 reload.
 *   confidence: high
 */
/* func_ov002_02213064 (ov002, cls D): state switch (0x7e/0x7f/0x80) keyed on
 * *(int*)(ce288+0x5a8); args derived as (1-bit0); two guards in the 0x7e arm. */
typedef unsigned short u16;

struct S02213064 {
    u16 f0;
    u16 b0 : 1;           /* +2 bit0 */
    u16    : 15;
};

extern char data_ov002_022ce288[];   /* +0x5a8 = state int */

extern int  func_ov002_021b3ecc(int a, int b, int hw0);
extern int  func_ov002_021b4120(int a, int b, int hw0);
extern int  func_ov002_021b9aa8(unsigned int a, unsigned int t);
extern void func_ov002_021d5c50(int a, int b, int hw0, int t);
extern void func_ov002_021d7970(int a, int u, int c);
extern void func_ov002_021e06e4(int a, int b, int hw0);
extern void func_ov002_021e2b3c(void);
extern void func_ov002_021e2c5c(void);

int func_ov002_02213064(struct S02213064 *self) {
    int state;
    int t, u;
    state = *(int *)(data_ov002_022ce288 + 0x5a8);
    switch (state) {
    case 0x80:
        func_ov002_021e06e4(1 - self->b0, 3, self->f0);
        return 0x7f;
    case 0x7f:
        if (func_ov002_021b3ecc(1 - self->b0, 11, self->f0) == 0) return 0;
        func_ov002_021e2b3c();
        return 0x7e;
    case 0x7e:
        t = func_ov002_021b4120(1 - self->b0, 11, self->f0);
        u = func_ov002_021b9aa8(1 - self->b0, t);
        if (t > 0 && u >= 0) {
            func_ov002_021d7970(1 - self->b0, u, 1);
            func_ov002_021d5c50(1 - self->b0, 11, self->f0, t);
            return 0x7e;
        }
        func_ov002_021e2c5c();
        return 0;
    default:
        return 0;
    }
}
