/* CAMPAIGN-PREP candidate for func_021b2eec (ov014, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: 3-way switch; reload o->f8 for 2nd call each state; ret=0 first; movge
 *   risk:       reshape-able: state0/2 RELOAD o->f8 for the second 0208c884 (orig re-ldr) - keep separate reads not a bound temp. State0 zeroes f8 via `mov r0,r4`(the ret=0 reg) so f8=ret as written. Risk: chained if/else vs switch jump form.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov014_021b2eec (ov014, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: CLASS C/D: 3-way switch on o->state; RELOAD o->f8 for the 2nd 0208c884 each state; r4=0 result accumulator declared first; >=0x10 via movge.
 */
/* func_ov014_021b2eec: scroll state machine. State0 ramps two BG scroll regs
 * (0400006c, 0400106c) by (counter-0x10) up to 0x10 then ->state1. State1
 * waits on 021b3568 then ->state2. State2 ramps by (-counter) and returns 1
 * once counter>=0x10. */

extern void func_0208c884(int reg, int val);
extern int  func_ov014_021b3568(void);

typedef struct { int state; int pad4; int f8; } Obj14_2eec;

int func_ov014_021b2eec(Obj14_2eec *o)
{
    int ret = 0;
    int s = o->state;
    if (s == 0) {
        int c = o->f8 + 1;
        o->f8 = c;
        func_0208c884(0x0400006c, c - 0x10);
        func_0208c884(0x0400106c, o->f8 - 0x10);
        if (o->f8 >= 0x10) {
            o->state = 1;
            o->f8 = ret;
        }
    } else if (s == 1) {
        if (func_ov014_021b3568() != 0)
            o->state = 2;
    } else if (s == 2) {
        int c = o->f8 + 1;
        o->f8 = c;
        func_0208c884(0x0400006c, -c);
        func_0208c884(0x0400106c, -o->f8);
        if (o->f8 >= 0x10)
            ret = 1;
    }
    return ret;
}
