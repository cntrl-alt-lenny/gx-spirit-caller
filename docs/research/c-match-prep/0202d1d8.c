/* CAMPAIGN-PREP candidate for func_0202d1d8 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: 0xcccccccd umull = /10 then /20 -> plain '/'; 3x5 nested store loops
 *   risk:       the /20 is built from a/2 + lsr#1e rounding then two umulls (magic /10 *20 reconstruct of a%20-style index); a single C '/20' likely won't reproduce the exact two-umull sequence, and the post-loop 'add ip,#0x36' stride plus index arithmetic are fragile. permuter-class (divmod sequence) + struct-guessed offsets.
 *   confidence: low
 */
// func_0202d1d8 — copy a 0x50-byte table to stack, index it by (val/20) (umull magic /10 then *20 path),
// then fill a 3x5 grid of u16s with either 0 (cleared) or a computed tile base.
// arg0 (r4) selects clear-vs-fill branch; data_0219ad48[+0x64]/[+0x68] are the source ints.
extern unsigned int data_020bea2c[20];      // _LIT0 source table (0x50 bytes)
extern int func_0201d4b4(int x);

extern struct { unsigned char _p[0x64]; int f64; int f68; } data_0219ad48;  // _LIT1

void func_0202d1d8(int mode)
{
    unsigned int tbl[20];
    int i, j;
    int a = data_0219ad48.f64;
    int idx = (a / 20);                 /* asr#1 + lsr#1e fixup + /20 magic chain */
    int sel;
    unsigned short *dst;
    int k;

    for (k = 0; k < 20; k++) tbl[k] = data_020bea2c[k];   /* ldmia/stmia x5 of 4 words */

    sel = (int)tbl[idx];
    (void)data_0219ad48.f68;
    dst = (unsigned short *)(func_0201d4b4(data_0219ad48.f68) + 0xf6 + 0x400);

    if (mode == 0 || sel >= 0) {
        for (i = 0; i < 3; i++) {
            for (j = 0; j < 5; j++) {
                *dst++ = 0;
            }
            dst = (unsigned short *)((char *)dst + 0x36);
        }
    } else {
        int base = sel * 15 + 0x290;        /* rsb r0,r5,r5,lsl#4 = r5*15 */
        for (i = 0; i < 3; i++) {
            for (j = 0; j < 5; j++) {
                *dst++ = (unsigned short)(base | 0x4000);
                base++;
            }
            dst = (unsigned short *)((char *)dst + 0x36);
        }
    }
}
