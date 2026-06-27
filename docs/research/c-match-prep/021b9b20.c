/* CAMPAIGN-PREP candidate for func_021b9b20 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: read-once u16 dual-bitfield (:13 id + bit15 flag), ptr-walk vs counter
 *   risk:       orig reads the u16 once into r1, compares id via a SHIFTED operand `cmp r0,r2,lsr#19` (keeping r1) then extracts bit15 from r1; mwcc may materialize id into its own reg instead of folding the shift into cmp (reshape-able if it doesn't fold; else 1 insn).
 *   confidence: med
 */
/* func_ov002_021b9b20: scan 255 4-byte records at data_ov002_022d0254
 * (pointer walks from base[0], trip counter 1..255); each record's u16
 * holds a :13 id at bit0 and a flag at bit15. Return 1 if a record matches
 * id==arg0 with the flag set, else 0. */
typedef unsigned short u16;
extern char data_ov002_022d0254[];

struct Rec9b20 { u16 id : 13; u16 : 2; u16 flag : 1; u16 _pad; };

int func_ov002_021b9b20(int id) {
    struct Rec9b20 *rec = (struct Rec9b20 *)data_ov002_022d0254;
    int i;
    for (i = 1; i < 0x100; i++) {
        if (rec->id == (unsigned int)id) {
            if (rec->flag)
                return 1;
        }
        rec++;
    }
    return 0;
}
