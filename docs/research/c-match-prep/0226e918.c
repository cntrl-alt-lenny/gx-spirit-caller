/* CAMPAIGN-PREP candidate for func_0226e918 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D bitfield :15-at-bit8 + :1 same-word; D sibling of d6f4
 *   risk:       reshape-able: the two same-word writes (bit0 then f8) must coalesce to ONE ldr/str RMW like d6f4 (orig holds word in r3, no reload); if mwcc reloads between them, 2nd RMW diverges. f8 must be :15 bitfield (plain mask gives 'and' not lsl#17/lsr#9).
 *   confidence: med
 */
/* func_ov002_0226e918: bitfield-pack into cd300 word@0 (bit0 + :15 at bit8),
 * u16@6, clear @0x16 bit1, byte@8=0, then nested 2x5 helper scan.
 * Direct sibling of func_ov002_0226d6f4 (.s): same pack, but this CLEARS
 * @0x16 bit (bic#2) and stores arg1 to +6; d6f4 SETS it (orr#2) and skips +6. */
typedef unsigned short u16;
/* word@0: bit0:1 ; bits1..7 pad ; :15 field at bit8 (mask 0x7fff00).
 * The asm masks with 0xff8000ff then OR-inserts (arg1<<17)>>9 -> a :15 field
 * starting at bit 8, which mwcc emits as lsl#17/lsr#9 from a bitfield store. */
struct W0e918 { unsigned bit0:1; unsigned pad:7; unsigned f8:15; unsigned hi:9; };
struct F22e918 { u16 b0:1; u16 bit1:1; u16 rest:14; }; /* @0x16 */
extern char data_ov002_022cd300[];
extern int func_ov002_02270184(int j, int i, int k);
int func_ov002_0226e918(int arg0, int arg1) {
    int j, i, k;
    ((struct W0e918 *)data_ov002_022cd300)->bit0 = arg0 & 1;
    ((struct W0e918 *)data_ov002_022cd300)->f8 = arg1;
    *(u16 *)(data_ov002_022cd300 + 0x6) = (u16)arg1;
    ((struct F22e918 *)(data_ov002_022cd300 + 0x16))->bit1 = 0;
    data_ov002_022cd300[0x8] = 0;
    k = 0;
    for (j = 0; j < 2; j++)
        for (i = 0; i <= 4; i++)
            if (func_ov002_02270184(j, i, k) != 0)
                return 1;
    return 0;
}
