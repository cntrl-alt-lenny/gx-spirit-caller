/* CAMPAIGN-PREP candidate for func_0226d95c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D: :1 bit0 + :15 field bitfields (lsl#17;lsr#9 pack); @0x16 :1 bit1; min-as if-assign for the < guard
 *   risk:       orig fuses bit0+:15 into ONE ldr/str RMW; two bitfield assigns likely emit two RMW cycles; also a dead 'mov;sub r1,#1' (-1) the orig materialises. reshape-able (manual single-word build) but the stray -1 is permuter-class
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov002_0226d95c (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED. Sibling of 0226d6f4 / 0226e918 (same header
 * pack into data_022cd300 word@0: bit0 + :15 field at bit8 via lsl#17;lsr#9).
 * This flavor SETS @0x16 bit1 (orr #2), does NOT store arg1 to +6, then two
 * calls + a less-than guard + a predicate return.
 */
typedef unsigned int   u32;
typedef unsigned short u16;

/* word @0x00: bit0:1, :7 pad, :15 field at bit8 (mask 0x7fff00), :9 top. */
struct Hdr300 { u32 b0 : 1; u32 _u1 : 7; u32 f8 : 15; u32 _u23 : 9; };
struct F30016 { u16 _b0 : 1; u16 b1 : 1; u16 _r : 14; };               /* @0x16 */

extern char data_ov002_022cd300[];
extern int  func_ov002_021b1200(int (*cb)(void));
extern int  func_ov002_021bcd80(void);
extern int  func_ov002_0226d814(int arg1);
extern int  func_ov002_022717f8(void);

int func_ov002_0226d95c(int arg0, int arg1) {
    int v;
    ((struct Hdr300 *)data_ov002_022cd300)->b0 = arg0;
    ((struct Hdr300 *)data_ov002_022cd300)->f8 = arg1;
    ((struct F30016 *)(data_ov002_022cd300 + 0x16))->b1 = 1;
    data_ov002_022cd300[0x8] = 0;
    v = func_ov002_021bcd80();
    if (v < func_ov002_0226d814(arg1))
        return 0;
    return func_ov002_021b1200(func_ov002_022717f8) != 0;
}
