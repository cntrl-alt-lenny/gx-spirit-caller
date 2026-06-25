/* CAMPAIGN-PREP candidate for func_02053ddc (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     TAIL-CALL thunk; three field loads + arg passthrough
 *   risk:       offsets 0x0/0x8/0x14 guessed; pure tail bx-via-ip should match; return type may be void
 *   confidence: high
 */
/* func_02053ddc: tail-call thunk loading three fields.
 *   r0=self->f_14; r1=self->f_0; r2=self->f_8; r3=a1; bx func_020a97b8
 * => return func_020a97b8(self->f_14, self->f_0, self->f_8, a1); */

typedef struct {
    int  f_0;     /* 0x00 */
    char _pad[0x4];
    int  f_8;     /* 0x08 */
    char _pad2[0x8];
    int  f_14;    /* 0x14 */
} obj_t;

extern int func_020a97b8(int a, int b, int c, int d);

int func_02053ddc(obj_t *self, int a1) {
    return func_020a97b8(self->f_14, self->f_0, self->f_8, a1);
}
