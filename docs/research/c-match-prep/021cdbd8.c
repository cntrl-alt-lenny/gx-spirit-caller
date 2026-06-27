/* CAMPAIGN-PREP candidate for func_021cdbd8 (ov011, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload (call 02018bc0 twice), don't CSE; explicit lsl/lsr overlapping bitfields.
 *   risk:       reshape-able: must call func_02018bc0(r5) a SECOND time for the bit-8 test (orig reloads, keeps r4 only for the byte/field tests); if mwcc CSEs the call away one bl disappears. Overlapping shifts (bit8 vs field[16:8]) block a clean bitfield struct.
 *   confidence: med
 */
/* func_ov011_021cdbd8: linear search 1..0x5f for a record whose packed
 * word at +0x8 matches a key. Match needs: byte[7:0] == arg+0x10, AND bit 8
 * clear, AND field[16:8] == the loop index. Returns the index, else 0.
 * Note the original RELOADS the record (calls 02018bc0 twice per iter) for
 * the bit-8 test rather than reusing r4.
 *
 *   r6=arg+0x10; for(i=1;i<0x60;i++){ r4=02018bc0(i);
 *     if(r6==((r4->f8<<0x18)>>0x18)){
 *       if(((02018bc0(i)->f8<<0x17)>>0x1f)==0)
 *         if(i==((r4->f8<<0xf)>>0x18)) return i; } }
 *   return 0;
 */

typedef struct { char _pad8[0x8]; unsigned int f_8; } S_18bc0;
extern S_18bc0 *func_02018bc0(int x);

int func_ov011_021cdbd8(int arg) {
    S_18bc0 *r4;
    int r6 = arg + 0x10;
    int r5;

    for (r5 = 1; r5 < 0x60; r5++) {
        r4 = func_02018bc0(r5);
        if (r6 == (int)((r4->f_8 << 0x18) >> 0x18)) {
            if (((func_02018bc0(r5)->f_8 << 0x17) >> 0x1f) == 0) {
                if (r5 == (int)((r4->f_8 << 0xf) >> 0x18))
                    return r5;
            }
        }
    }
    return 0;
}
