/* CAMPAIGN-PREP candidate for func_021c6454 (ov006, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     :1 bitfield for the lsl#31;lsr#31 guard; bind row+dst-base; ldrsh tmp
 *   risk:       second loop addressing: orig forms &tmp[i*4] and &dst[i*2] once and steps both by 8; if mwcc recomputes i*8 per access the base-update insns diverge. permuter-class (loop reg-alloc/CSE).
 *   confidence: med
 */
/* func_ov006_021c6454: if active-row flag bit0 set, copy a 10-entry table to a
   stack scratch, reset the global record, scatter 5 rows of 4 shorts into it at
   +0x34, then write four tail fields; return 1. */
extern short data_ov000_021b1d4c[];   /* dst global record (_LIT0) */
extern short data_ov006_021cb820[];   /* src table (_LIT1) */
extern void  func_ov005_021aa4b0(void *p);
struct Row6454 { int f0; int f4; int f8; unsigned bit0 : 1; };  /* 16-byte row; bit0@+0xc -> lsl#31;lsr#31 */
int func_ov006_021c6454(char *obj) {
    short tmp[20];                                   /* 0x28 stack; 10*4 bytes copied */
    struct Row6454 *e = (struct Row6454 *)(obj + 0x6c) + *(int *)(obj + 0x4c);
    int i;
    if (e->bit0) {
        for (i = 0; i < 10; i++) {
            tmp[i * 2]     = data_ov006_021cb820[i * 2];
            tmp[i * 2 + 1] = data_ov006_021cb820[i * 2 + 1];
        }
        func_ov005_021aa4b0(data_ov000_021b1d4c);
        *(int *)data_ov000_021b1d4c = 0;
        for (i = 0; i < 5; i++) {
            short *d = (short *)((char *)data_ov000_021b1d4c + i * 8 + 0x34);
            short *s = tmp + i * 4;
            d[0] = s[0];
            d[1] = s[1];
            d[2] = s[2];
            d[3] = s[3];
        }
        *(int *)((char *)data_ov000_021b1d4c + 0x4) = e->f4;
        *(int *)((char *)data_ov000_021b1d4c + 0x8) = e->f8 - 6;
        *(int *)((char *)data_ov000_021b1d4c + 0xc) = 6;
        *(int *)((char *)data_ov000_021b1d4c + 0x10) = e->f0;
    }
    return 1;
}
