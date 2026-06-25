/* CAMPAIGN-PREP candidate for func_02037fe4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     nibble switch (w>>0x14)&0xf; mla id*0xc base; movs/movmi clamp to 0; signed b24->b25
 *   risk:       struct-guessed/reshape-able: the else-branch addr is `data_0219b2e0->w34 + (u16w)*0xc` via mla; if mwcc binds the *0xc product to a base or reorders the +0x4 pointer it diverges. The movs r2,lsl#1/movmi #0 must stay if-assign not max. Confirm 0xc stride and w34 offsets.
 *   confidence: low
 */
extern unsigned char data_0219b2e0[];
extern void *func_02037b58(int a);
extern void func_0203c5a4(int a, int b, int c);
extern void func_02087528(int a, int b);
extern void func_02087da4(void *p, int kind, int val);

typedef struct {
    char pad4[0x4];
    int w4;             /* +0x4 */
    char pad24[0x24 - 0x8];
    signed char b24;    /* +0x24 */
    signed char b25;    /* +0x25 */
    char pad34[0x34 - 0x26];
    unsigned int w34;   /* +0x34 */
    char pad68[0x68 - 0x38];
    unsigned short h68; /* +0x68 */
} S37f;

typedef struct {
    char pad7[0x7];
    unsigned char b7;   /* +0x7 */
} Tbl37;

int func_02037fe4(int a, int b, int c) {
    S37f *o = (S37f *)func_02037b58(a);
    unsigned int w;
    int sel;
    if (o == 0) return 0;
    o->b24 = (signed char)b;
    if (o->h68 & 0x6000) return 1;
    w = o->w34;
    sel = (w >> 0x14) & 0xf;
    if (sel == 4) {
        func_0203c5a4(o->w4, b, c);
    } else if (sel == 5) {
        func_02087528(o->w4, b);
    } else {
        unsigned int id = (unsigned short)w;
        Tbl37 *t = (Tbl37 *)((char *)((S37f *)data_0219b2e0)->w34 + id * 0xc);
        if (t->b7 & 0x40) {
            int v0 = (b - 0x40) << 1;
            if (v0 < 0) v0 = 0;
            func_02087da4((char *)o + 4, 1, v0);
            {
                int v1 = b << 1;
                if (v1 > 0x7f) v1 = 0x7f;
                func_02087da4((char *)o + 4, 2, v1 - 0x7f);
            }
        } else {
            func_02087da4((char *)o + 4, (int)(unsigned short)0xffff, b - 0x40);
        }
    }
    o->b25 = o->b24;
    return 1;
}
