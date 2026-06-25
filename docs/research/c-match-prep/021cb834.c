/* CAMPAIGN-PREP candidate for func_021cb834 (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     nested grid o*0x40+j*2 RMW; signed (s8) pos; /8 divides; 3-way split
 *   risk:       struct-guessed+permuter-class: the `rsb;mov lsl#24;ror#24` pos reconstruction is a signed-byte/modulo I can't pin (cmp #0xd0 contradicts pure s8); the three /8 fills' src/dst/len reg-alloc will diverge.
 *   confidence: low
 */
/* func_ov004_021cb834 (ov004, class C/D): 6x32 grid palette RMW + divmod scaling.
 * grid: for o in 0..5, j in 0..0x1f: h=*(u16*)(D+0x5000+0xd8 + o*0x40 + j*2);
 *   h = (h & 0xfff) | (a1<<12); store back.
 * pos = (signed char)(a0*0x30); if(pos>0xd0) split into 3 func_02094550 fills
 * else single fill. uses func_0208e0a0() base + signed /8 divides. */
extern char data_ov004_0220b500[];
extern int func_0208e0a0(void);
extern void func_02094550(int dst, int src, int n);

void func_ov004_021cb834(int a0, int a1) {
    char *D = data_ov004_0220b500;
    int o, j;
    int pos;
    int b;
    for (o = 0; o < 6; o++) {
        for (j = 0; j < 0x20; j++) {
            unsigned short *h = (unsigned short *)(D + 0x5000 + 0xd8 + o * 0x40 + j * 2);
            *h = (unsigned short)((*h & 0xfff) | (a1 << 12));
        }
    }
    pos = (signed char)(a0 * 0x30);
    if (pos > 0xd0) {
        int wrap = 0x100 - pos;
        b = func_0208e0a0();
        func_02094550((int)(D + 0xd8 + 0x5000) /*+ (pos/8)*0x40*/ ,
                      b + (pos / 8) * 0x40, ((wrap << 5) / 8) << 1);
        b = func_0208e0a0();
        func_02094550((int)(D + 0xd8 + 0x5000) + ((wrap << 5) / 8 << 1),
                      b, ((0x30 - wrap) << 5) / 8 << 1);
    } else {
        b = func_0208e0a0();
        func_02094550((int)(D + 0xd8 + 0x5000), b + (pos / 8) * 0x40, 0x180);
    }
}
