/* CAMPAIGN-PREP candidate for func_021c988c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     switch 0xb..0xf; case0xd bitfield-pack (>>22,>>13) + eor result; case0xf signed asr byte-extract
 *   risk:       permuter-class: case-0xf .L_bc uses ldrh then asr#8;and;asr#1;and — my `(short)h>>8` likely emits ldrsh or an extra sxth, diverging 4-instr extraction. Also struct-guessed cd73c stride/0x260 and the cd4cc/d016c LIT bases (extern-name guessed).
 *   confidence: low
 */
/* func_ov002_021c988c (ov002, class D, MED) — switch(arg1) cases 0xb..0xf.
 * Mixed: bitfield-pack call (case 0xd), eor parity bit, packed-byte switch
 * (case 0xf) with asr/and extraction, equality+call guard (case 0xc). */
extern unsigned short data_ov002_022cd4b8[];   /* unused-sym parity? kept for delink */
extern unsigned char  data_ov002_022cd73c[];   /* LIT0 base for case 0xd */
extern unsigned char  data_ov002_022cf16c[];
extern unsigned char  data_ov002_022cf1a4[];   /* LIT3 */
extern unsigned char  data_ov002_022cf8f4[];   /* LIT4 base for case 0xf */
extern int  data_ov002_022d016c;               /* LIT5 base (.f_4) for case 0xc */
extern int  func_ov002_021b3fd8(int player, int kind, int code, int d);
extern int  func_ov002_021c3cc8(int player);

int func_ov002_021c988c(int arg0, int arg1, int arg2) {
    switch (arg1) {
    case 0xc: {
        if (arg0 == *(int *)(&data_ov002_022d016c + 0x4 / 4))
            return 1;
        if (func_ov002_021c3cc8(arg0) != 0)
            return 1;
        return 0;
    }
    case 0xd: {
        unsigned int v = *(unsigned int *)(data_ov002_022cd73c
                          + (arg0 & 1) * 0x100000 + 0x260 + arg2 * 4);
        int packed = (int)(((v >> 22) & 0xff) << 1) + (int)((v >> 13) & 1);
        int r = func_ov002_021b3fd8(arg0, 0xb, (int)(long)data_ov002_022cd4cc, packed);
        return (int)((*(unsigned int *)(data_ov002_022cf1a4 + 0xd0) >> 2) & 1) ^ r;
    }
    case 0xe:
        return 0;
    case 0xf: {
        unsigned short h = *(unsigned short *)(data_ov002_022cf8f4
                            + (arg0 & 1) * 0x868 + arg2 * 2);
        int lo = h & 0xff;
        if (lo == 0x40)
            return ((((short)h >> 8) & 0xff) >> 1) & 1;
        if (lo == 0x80)
            return 0;
        return 1;
    }
    default:
        return 0;
    }
}
