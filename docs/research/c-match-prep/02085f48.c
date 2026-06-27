/* CAMPAIGN-PREP candidate for func_02085f48 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     flag-branch store-order; smull>>8 = (s64)a*b>>8; -(x<<4)*y; bind sp-struct as int[]
 *   risk:       batch asm truncated before .L_7f0; struct offsets + the s[] index->sp-offset mapping are inferred; store-order across branches likely diverges — struct-guessed + permuter-class.
 *   confidence: low
 */
/* func_02085f48: builds a 0x3c stack-struct from obj flags then FX-scales fields,
 * passes &struct+4 to func_02084e0c(0x0e? ...).  obj @ r0.  Flag bits in obj[0]: 8,4,1.
 * smull r3,rH,a,b; lsr#8|lsl#0x18 = (s64)a*b>>8 ; the .L_7f0 scaler = (s64)*>>12. */
typedef signed int s32;
typedef unsigned short u16;
typedef signed long long s64;
typedef s32 fx32;

typedef struct {
    u32 f0;
    char _04[0x14];
    fx32 a18;
    fx32 a1c;
    fx32 a24;
    fx32 a28;
    char _2c[4];
    fx32 a30;
    fx32 a34;
    char _38[2];
    u16 a2c;
    u16 a2e;
} Obj;
typedef unsigned int u32;

extern void func_02084e0c(int, int *, int);

void func_02085f48(Obj *o) {
    int s[15];                  /* 0x3c bytes */
    s[13] = 0;                  /* sp+0x34 */
    s[14] = 2;                  /* sp+0x38 */
    s[0] = (o->f0 & 8) ? 0x00101710 : 0x00101910; /* literal pool placeholders */
    s[1] = 3;
    s[10] = 0; s[9] = 0; s[8] = 0; s[7] = 0;
    s[5] = 0; s[4] = 0; s[3] = 0;
    if (o->f0 & 4) {
        s[11] = 0; s[12] = 0;
        if (o->f0 & 1) { s[2] = 0x1000; s[6] = 0x1000; }
        else { s[2] = o->a18; s[6] = o->a1c; }
    } else if (o->f0 & 1) {
        s[11] = -(o->a24 << 4) * (int)o->a2c;
        s[12] = -(o->a28 << 4) * (int)o->a2e;
        s[2] = 0x1000; s[6] = 0x1000;
    } else {
        s[11] = -(int)((((s64)o->a18 * o->a24) >> 8)) * (int)o->a2c;
        s[12] = -(int)((((s64)o->a1c * o->a28) >> 8)) * (int)o->a2e;
        s[2] = o->a18;
        s[6] = o->a1c;
    }
    /* .L_7f0: scale by obj[0x30]/0x34 if != 0x1000 (Q12) — body continues past batch */
    func_02084e0c(s[0], &s[1], 0x0e);
}
