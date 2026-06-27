/* CAMPAIGN-PREP candidate for func_02202c8c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     eor of two :1 bitfields +&1; byte-indexed *0x868 int load; rsb 1-bit0
 *   risk:       The redundant `& 1` after the eor: orig emits `and r2,r2,#1` before the mul, so the mask must survive in C; if mwcc proves the eor already 1-bit and drops the `and`, one instruction diverges. reshape-able (the explicit `& 1` is retained; if dropped, mask via `(unsigned char)`).
 *   confidence: med
 */
/* func_ov002_02202c8c (cls C): XOR-keyed per-player count guard + global gate.
 * idx = self->bit0 ^ self->bit14 (each 1 bit) -> data_022cf17c[idx*0x868] (byte
 * offset). If 0 -> return 0. Then if global d016c[+0xcf8]==0 -> return 1; else
 * func_021bae7c(1-bit0, 0x178b, -1) -> if nonzero return 0 else return 1.
 * bit14 read as :1 bitfield (lsl#17;lsr#31), NOT (f2>>14)&1. */

typedef unsigned short u16;

struct F02202c8c_F2 { u16 bit0 : 1; u16 _1 : 13; u16 bit14 : 1; };
struct F02202c8c_Self { u16 f0; struct F02202c8c_F2 f2; };

extern int  data_ov002_022cf17c[];
extern char data_ov002_022d016c[];
extern int  func_ov002_021bae7c(int player, int code, int arg);

int func_ov002_02202c8c(struct F02202c8c_Self *self) {
    int bit0 = self->f2.bit0;
    int idx = (bit0 ^ self->f2.bit14) & 1;
    if (*(int *)((char *)data_ov002_022cf17c + idx * 0x868) == 0)
        return 0;
    if (*(int *)(data_ov002_022d016c + 0xcf8) == 0)
        return 1;
    if (func_ov002_021bae7c(1 - bit0, 0x178b, -1) != 0)
        return 0;
    return 1;
}
