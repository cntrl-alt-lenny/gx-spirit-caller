/* CAMPAIGN-PREP candidate for func_0228deec (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     +0x120 stride-4 :13 bitfield; hold id across both calls; rsb (3-x); accumulator-first add
 *   risk:       id must stay live in a callee-saved reg across both bl (mwcc should, since used as arg twice); main risk is the combine 'add r0,(3-x),y' operand order and that mwcc keeps x in r4 — reshape-able (bind x to a temp, write (3-x)+y). low residual.
 *   confidence: med
 */
/* func_ov002_0228deec: mla base + :13 bitfield + rsb combine, two calls
 * (cls C). id = slot.id from a STRIDE-4 array at +0x120 (NOT the 0x14/+0x30
 * slot): cf16c + (arg0&1)*0x868 + arg1*4 + 0x120, :13 field. id is held in a
 * callee-saved reg across BOTH calls. return (3 - func_0202b9b0(id)) +
 * func_022815a4(id,0). rsb => 3 - x; operand order accumulator-first. */
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cf16c[];
extern int  func_0202b9b0(int id);
extern int  func_ov002_022815a4(int id, int b);

int func_ov002_0228deec(int arg0, int arg1) {
    unsigned int id = ((struct Ov002Slot *)(data_ov002_022cf16c +
                       (arg0 & 1) * 0x868 + arg1 * 4 + 0x120))->id;
    int x = func_0202b9b0(id);
    return (3 - x) + func_ov002_022815a4(id, 0);
}
