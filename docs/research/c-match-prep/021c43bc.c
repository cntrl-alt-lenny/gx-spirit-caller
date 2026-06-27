/* CAMPAIGN-PREP candidate for func_021c43bc (ov006, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order stmia {type,payload}, chained && bound compares, per-entry loop
 *   risk:       TRUNCATED asm (tail past .L_1f90 cut) so final-box logic is a guess; also struct-guessed bound layouts. permuter-class on the cmp/ldrgesh/cmpge fused-compare chains (mwcc may not emit conditional ldrsh).
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_ov006_021c43bc (ov006, class D) — brief 494.
 * UNVERIFIED build-free + TRUNCATED asm (size 332, tail cut). out-param r3.
 * coordinate(x=r1,y=r2)->region classifier writing out{type,payload,_}.
 * zero out[0..2]; row = self+0x9c+idx*0x10. scan data_021cddfc (2 entries,
 *  stride 0xc, fields s16[0..3]=bounds,[4]=payload) box-test -> out={1,payload};
 * else if data_021cde14[self->f58] == 2: scan data_021cde2c (2 entries) ->
 *  out={3,0}; else final fixed-box (x in [0xf,0xd4], y in [0x1e,0x2e]) -> out={2,i}.
 * box-test = (x>=lo0 && y>=lo1) && !(x>lo2 && y>lo3) style chained cmp.
 * recipe: store-order via stmia {type,payload}, chained && bound compares.
 */
typedef short s16;
struct Box43bc { s16 x0; s16 y0; s16 x1; s16 y1; s16 pay; s16 _a; }; /* stride 0xc */
extern struct Box43bc data_ov006_021cddfc[2];
extern struct Box43bc data_ov006_021cde2c[2];
extern s16 data_ov006_021cde14[];

struct Out43bc { int type; int payload; int _8; };
struct Row43bc { int f0; int f4; int f8; int fc; };

int func_ov006_021c43bc(char *self, int x, int y, struct Out43bc *out) {
    struct Row43bc *row =
        (struct Row43bc *)(self + 0x9c + *(int *)(self + 0x64) * 0x10);
    struct Box43bc *b = data_ov006_021cddfc;
    int i;
    out->type = 0;
    out->payload = 0;
    out->_8 = 0;
    for (i = 0; i < 2; i++, b++) {
        if (x >= b->x0 && y >= b->y0 && !(x > b->x1 && y > b->y1)) {
            out->type = 1;
            out->payload = b->pay;
            return 1;
        }
    }
    if (data_ov006_021cde14[*(int *)(self + 0x58) * 2] == 2) {
        struct Box43bc *c = data_ov006_021cde2c;
        for (i = 0; i < 2; i++, c++) {
            if (x >= c->x0 && y >= c->y0 && !(x > c->x1 && y > c->y1)) {
                out->type = 3;
                out->payload = 0;
                return 1;
            }
        }
    }
    for (i = 0; i < 2; i++) {
        int skip = 0;
        if (i >= 1) {
            if (!(row->fc & 1) && i >= row->f8)
                skip = 1;
        }
        if (!skip && !(x >= 0xf && y >= 0x1e) ) { /* placeholder for cut tail */ }
        if (!(x < 0xd4 && y < 0x2e)) {
            /* outside */
        } else {
            out->type = 2;
            out->payload = i;
            return 1;
        }
    }
    return 0;
}
