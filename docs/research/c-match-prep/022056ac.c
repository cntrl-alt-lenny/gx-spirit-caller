/* CAMPAIGN-PREP candidate for func_022056ac (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind f14 once; bitfield b17 then b14; (b14==0) gives moveq#1/movne#0
 *   risk:       orig reads f14 once into r0 then extracts b17 (lsl14;lsr31) & b14 (lsl17;lsr31); if mwcc reloads ldr[+0x14] for the second bitfield, 1 extra ldr. reshape-able / struct-guessed offsets.
 *   confidence: med
 */
/* func_ov002_022056ac: 021ff... gate, then two bitfield tests on the
 * +0x14 dword: if bit17 set return 0; else return (bit14 == 0).
 * f14 read once, bit17 (lsl14;lsr31) then bit14 (lsl17;lsr31). */
typedef unsigned short u16;
struct F14 { unsigned int pad14:14; unsigned int b14:1; unsigned int :2; unsigned int b17:1; unsigned int hi:14; };
struct S022056ac { unsigned char pad[0x14]; struct F14 f14; };
extern int func_ov002_022055fc(struct S022056ac *self);
int func_ov002_022056ac(struct S022056ac *self) {
    if (func_ov002_022055fc(self) == 0) return 0;
    if (self->f14.b17) return 0;
    return self->f14.b14 == 0;
}
