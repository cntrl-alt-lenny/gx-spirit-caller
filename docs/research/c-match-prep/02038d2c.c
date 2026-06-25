/* CAMPAIGN-PREP candidate for func_02038d2c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     u8 field -> *2 index, mla 0xc stride, 2-iter scan for f4==0
 *   risk:       index (field*2) may materialize as mov;add,lsl vs mov,lsl - the odd mov#0;add,lsl#1 form is the residual risk
 *   confidence: med
 */
/* func_02038d2c - read u8 at +0x1f, index data_0219c4a0[field*2] (0xc stride), scan 2 for f4==0 */

typedef struct {
    int f0;
    int f4;
    int f8;
} Rec;               /* 0xc */

extern Rec data_0219c4a0[];

Rec *func_02038d2c(const unsigned char *p)
{
    Rec *e = &data_0219c4a0[p[0x1f] << 1];
    int i;

    for (i = 0; i < 2; i++) {
        if (e->f4 == 0)
            return e;
        e++;
    }
    return 0;
}
