/* CAMPAIGN-PREP candidate for func_0222bf50 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     sel as ?1:0 (moveq/movne); bind rec across uses; reload f2 for rsb 1-bit0
 *   risk:       The rsb r1,#1 uses f2 bit0 via lsl#1f;lsr#1f (1 - self->f2.bit0), but my f2 lays kind6 at bit6 leaving bit0 ambiguous; struct-guessed (bit0 vs lo6:6 collision) plus mid-byte vs ((u16)dec>>8)&0xff shift form is reshape-able.
 *   confidence: low
 */
/* func_ov002_0222bf50: if self->f2.kind6 == 0x16, pick a 0x38-stride record
 * (by comparing global d3f4[+0x38] to self->unk14's low-23-bit field), decode
 * it via 021b947c, branch on the mid-byte (<=4 -> 021c8470(lo) else table
 * lookup -> 0202b8f0), then forward the result through 021df818. */
typedef unsigned short u16;
struct F0222bf50_F2 { u16 lo6:6; u16 kind6:6; u16 hi4:4; };
struct F0222bf50_Self { u16 f0; struct F0222bf50_F2 f2; };
extern char data_ov002_022cd3f4[];
extern char data_ov002_022cd42c[];
extern u16  data_ov002_022d0250[];
extern int  func_0202b8f0(int v13);
extern int  func_ov002_021b947c(int rec);
extern int  func_ov002_021c8470(int lo);
extern void func_ov002_021df818(void *self, int notbit0, int v);

int func_ov002_0222bf50(struct F0222bf50_Self *self) {
    if (self->f2.kind6 == 0x16) {
        int sel = (*(int *)(data_ov002_022cd3f4 + 0x38) ==
                   (int)((unsigned)(*(int *)((char *)self + 0x14)) << 23 >> 23)) ? 1 : 0;
        int rec = *(int *)(data_ov002_022cd42c + sel * 0x38);
        int dec = func_ov002_021b947c(rec);
        int v;
        if ((int)((((u16)dec >> 8) & 0xff)) > 4) {
            v = func_0202b8f0((int)((unsigned)data_ov002_022d0250[rec * 2] << 19 >> 19));
        } else {
            v = func_ov002_021c8470(dec & 0xff);
        }
        func_ov002_021df818(self, 1 - ((self->f2.lo6 >> 0) & 1), v);
    }
    return 0;
}
