/* CAMPAIGN-PREP candidate for func_02096f64 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind inner,&reg30; stack arg; r0==0 block copy 0x30->0x20 then guarded halfword/mask stores
 *   risk:       the 3-word ldmia/stmia block copy needs r4=&p->f30 held and copied as one struct=struct; if mwcc lowers the field stores individually it emits ldr/str x3 not ldmia/stmia - reshape-able via a struct-type member assignment (reg30 copy), else permuter
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02096f64 (main, class C) - p_0044.
 * UNVERIFIED build-free draft: drop into src/, ninja + objdiff, tweak per risk.
 *   recipe:     bind r5=p->f08, r4=&p->f30; stack arg; on r0==0 do 3-word block copy +0x30->+0x20 then guarded halfword/masked stores
 *   risk:       see risk note
 *   confidence: low
 */
/* func_02096f64: inner=p->f08; h=p->f34h (u16 at +0x34); build {inner, inner->f34 + (h<<3)} stack arg,
 * out 2-word; r=func_020970a8(out,in,8); if(r) goto done; copy p->reg30[0..2] -> p->reg20[0..2];
 * if(p->f36h==0 && p->f38==0){ p->f26h=out_hi16; p->f28=inner->f34 + out_lo; } p->f2c = out_hi16 & 0xfff; done:return r. */

extern int func_020970a8(void *out, void *in, int size);

typedef struct {
    int           f00;   /* +0x30 copied as block */
    int           f04;   /* +0x34 */
    int           f08;   /* +0x38 */
} Triple02096f64;

typedef struct {
    unsigned char pad00[0x8];
    void         *f08;          /* 0x08 -> inner */
    unsigned char pad0c[0x18];
    unsigned short f26;         /* 0x26 */
    int            f28;         /* 0x28 */
    int            f2c;         /* 0x2c */
    Triple02096f64 reg30;       /* 0x30,0x34,0x38 */
} Obj02096f64;

typedef struct {
    unsigned char pad00[0x34];
    int           f34;          /* 0x34 */
} Inner02096f64;

int func_02096f64(Obj02096f64 *p)
{
    Inner02096f64 *inner;
    unsigned int   h;
    int            in[2];
    int            out[2];
    int            r;

    inner = (Inner02096f64 *)p->f08;
    in[0] = (int)p->f08;
    h = *(unsigned short *)((char *)p + 0x34);
    in[1] = inner->f34 + (h << 3);
    r = func_020970a8(out, in, 8);
    if (r != 0) {
        return r;
    }

    *(int *)((char *)p + 0x20) = *(int *)((char *)p + 0x30);
    *(int *)((char *)p + 0x24) = *(int *)((char *)p + 0x34);
    *(int *)((char *)p + 0x28) = *(int *)((char *)p + 0x38);

    if (*(unsigned short *)((char *)p + 0x36) == 0 &&
        *(int *)((char *)p + 0x38) == 0) {
        p->f26 = *(unsigned short *)((char *)out + 0x4);
        p->f28 = inner->f34 + out[0];
    }
    p->f2c = *(unsigned short *)((char *)out + 0x6) & 0xfff;
    return r;
}
