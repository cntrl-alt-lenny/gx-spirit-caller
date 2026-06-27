/* CAMPAIGN-PREP candidate for func_02021a3c (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: store-order [s+8]=w then [s]=t; switch jump-table 0..6 stores result; default rewinds i & s
 *   risk:       reshape-able/struct-guessed: store-order ([s+8] before [s]) and the default branch's `i--/s-=0xc` rewind (net retry) are load-bearing -- keep them explicit. Tag read `(unsigned)w>>0x18`==0xf0 must be `lsr#0x18`. If switch becomes cmp-chain, dispatch diverges.
 *   confidence: med
 */
/* func_02021a3c (class D): scan up to 0x80 packed records, dispatch, store result.
 *   r5=arg0+0x18; r6=arg1+0x4; r4=0;
 *   loop (i<0x80):
 *     w=[r6]; if((w>>0x18)==0xf0) break;
 *     [r5+8]=w; t=[r6+4]; r6+=8; [r5]=t;
 *     switch(t) 0..6: r=handler([r5+8]); [r5+4]=r; advance;
 *       default(>6): i--, r5-=0xc;  (then i++, r5+=0xc -> net no-op, retry same slot)
 *     i++; r5+=0xc;
 *   return i;
 */
extern int func_02021c30(int);
extern int func_020234f8(int);
extern int func_02024024(int);
extern int func_02024574(int);
extern int func_020270d0(int);
extern int func_02028790(int);
extern int func_0202a27c(int);

struct Slot {
    int field0;   /* +0x00 = type t */
    int result;   /* +0x04 = handler result */
    int word;     /* +0x08 = packed record w */
};                /* stride 0xc */
struct Rec {
    int hi;       /* +0x00, top byte (>>0x18) is the tag */
    int payload;  /* +0x04 */
};                /* stride 0x8 */

int func_02021a3c(char *arg0, struct Rec *src) {
    struct Slot *s = (struct Slot *)(arg0 + 0x18);
    struct Rec  *r = src + 1;          /* arg1 + 0x4 (one Rec) */
    int i = 0;
    while (i < 0x80) {
        int w = ((int *)r)[0];
        if ((unsigned)w >> 0x18 == 0xf0) break;
        s->word = w;
        {
            int t = ((int *)r)[1];
            r = (struct Rec *)((char *)r + 8);
            s->field0 = t;
            switch (t) {
            case 0: s->result = func_02021c30(s->word); break;
            case 1: s->result = func_020234f8(s->word); break;
            case 2: s->result = func_02024024(s->word); break;
            case 3: s->result = func_02024574(s->word); break;
            case 4: s->result = func_020270d0(s->word); break;
            case 5: s->result = func_02028790(s->word); break;
            case 6: s->result = func_0202a27c(s->word); break;
            default:
                i--;
                s = (struct Slot *)((char *)s - 0xc);
                break;
            }
        }
        i++;
        s = (struct Slot *)((char *)s + 0xc);
    }
    return i;
}
