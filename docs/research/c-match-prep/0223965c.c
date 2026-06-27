/* CAMPAIGN-PREP candidate for func_0223965c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: parity/idx :1/:5 bitfields; raw shifts for non-contiguous composed-W; u8[] table arith reproduces parity*0x868+idx*0x14+0x30
 *   risk:       struct-guessed: 0x868/0x14/0x30 strides and h4 :9 bit-positions inferred from shifts; if real struct differs the mul/ldr offsets diverge. Confirm table layout.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

extern u8 data_ov002_022cf16c[];
extern u8 data_ov002_022cf1a4[];
extern int func_ov002_021d94ac(int a, int b, int c, int d);

typedef struct {
    u16 h0;
    u16 parity : 1;   /* h2 bit0  */
    u16 idx   : 5;    /* h2 bits[5:1] */
    u16 h2_rest : 10;
    u16 cmpval : 9;   /* h4 bits[14:6] -> (h4>>6)&0x1ff */
    u16 h4_rest : 7;
} Ent;

int func_ov002_0223965c(Ent *e) {
    int parity = e->parity;
    int idx = e->idx;
    u32 w = *(u32*)(data_ov002_022cf16c + parity * 0x868 + idx * 0x14 + 0x30);
    int composed = (((w >> 6) & 0xff) << 1) + ((w >> 13) & 1);
    if (e->cmpval != composed) return 0;
    if (*(u16*)(data_ov002_022cf1a4 + parity * 0x868 + idx * 0x14) == 0) return 0;
    func_ov002_021d94ac(parity, idx, 1, 0x1a90);
    return 0;
}
