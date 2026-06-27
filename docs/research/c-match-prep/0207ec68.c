/* CAMPAIGN-PREP candidate for func_0207ec68 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: bitfield-free (u16)<<3 run; mla base+0x100+h4*8; store-order h8 then he; do-while fill
 *   risk:       struct-guessed: all offsets (field14, ha/he, field0*0x540) inferred from ldr/ldrh; if real Cell layout differs the mla base and final two strh diverge. Confirm against struct.
 *   confidence: low
 */
/* func_0207ec68: clear/fill a horizontal run of 8-byte cell entries.
 * cell base = data_021a08f4 + s->field0 * 0x540 + 0x100; entry stride 8,
 * halfword at entry+0 written with 0xc0. Two branches keyed on s->field14.
 * struct offsets inferred from ldrh/ldr; field14 at +0x14 is the gate flag. */
extern unsigned char data_021a08f4[];
extern void  Fill32(int val, void *dst, int count);
extern void  func_020928cc(void *dst, int count);
extern void  func_020940ac(int a, void *dst, int val, int count);
extern int   data_0210249c;

typedef struct {
    int      field0;      /* +0x00 */
    unsigned short h4;     /* +0x04 */
    unsigned short h6;     /* +0x06 */
    unsigned short h8;     /* +0x08 */
    unsigned short ha;     /* +0x0a */
    unsigned short pad_c;  /* +0x0c */
    unsigned short he;     /* +0x0e */
    unsigned char  pad10[4];/* +0x10 */
    int      field14;     /* +0x14 */
} Cell;

void func_0207ec68(Cell *s) {
    int run;
    if (s->field14 != 0) {
        unsigned short h6 = s->h6;
        unsigned short h8 = s->h8;
        int flag = 0;
        if (h8 <= (unsigned short)(h6 + 1)) {
            if (s->h4 <= h6) flag = 1;
        }
        if (flag) {
            run = ((unsigned short)(h6 - s->h4 + 1)) << 3;
        } else {
            run = 0;
        }
        {
            unsigned char *p = data_021a08f4 + s->field0 * 0x540 + 0x100 + (s->h4 << 3);
            func_020928cc(p, run);
            if (data_0210249c == -1) {
                Fill32(0xc0, p, run);
            } else {
                func_020940ac(data_0210249c, p, 0xc0, run);
            }
        }
    } else {
        unsigned char *p = data_021a08f4 + s->field0 * 0x540 + 0x100 + (s->h4 << 3);
        unsigned short n = (unsigned short)(s->h6 - s->h4 + 1);
        unsigned short i = 0;
        if (n != 0) {
            unsigned short *q = (unsigned short *)p;
            do {
                i = (unsigned short)(i + 1);
                *q = 0xc0;
                q += 4;            /* stride 8 bytes */
            } while (i < n);
        }
    }
    s->h8 = s->h4;
    s->he = s->ha;
}
