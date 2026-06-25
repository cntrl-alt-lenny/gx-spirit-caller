/* CAMPAIGN-PREP candidate for func_02206bf8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     021bbc58(b0,0x12)+021ca2b8(b0) gates; unsigned >0/bcc loop; bitfield b0
 *   risk:       same loop class as 02205f80/0220717c: count unsigned >0 (bls) + i<bound unsigned (bcc); signed read -> ble/blt mismatch. reshape-able (unsigned casts). f0 reload inside loop matches orig.
 *   confidence: med
 */
/* func_ov002_02206bf8: two gates 021bbc58(b0,0x12) then 021ca2b8(b0),
 * then the canonical counted helper loop over T178/T16c[player].
 * b0 = lsl31;lsr31 bitfield. */
typedef unsigned short u16;
struct F2 { u16 bit0:1; u16 rest:15; };
struct S02206bf8 { u16 f0; struct F2 f2; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int func_ov002_021bbc58(unsigned int bit, int k);
extern int func_ov002_021ca2b8(unsigned int bit);
extern int func_ov002_022536e8(u16 f0, int i);
int func_ov002_02206bf8(struct S02206bf8 *self) {
    int i;
    if (func_ov002_021bbc58(self->f2.bit0, 0x12) == 0) return 0;
    if (func_ov002_021ca2b8(self->f2.bit0) == 0) return 0;
    if (*(unsigned int *)(data_ov002_022cf178 + (self->f2.bit0 & 1) * 0x868) > 0) {
        for (i = 0; i < *(unsigned int *)(data_ov002_022cf16c + (self->f2.bit0 & 1) * 0x868 + 0xc); i++) {
            if (func_ov002_022536e8(self->f0, i) != 0) return 1;
        }
    }
    return 0;
}
