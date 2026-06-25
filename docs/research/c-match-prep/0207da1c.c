/* CAMPAIGN-PREP candidate for func_0207da1c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield :7 extract (asr#8;and;lsl16;lsr16), pointer arith, two stores
 *   risk:       lsl#16;lsr#16 u16-truncation hard to force; the asr#8 vs lsr ordering may flip; field offsets/types guessed — likely permuter-class
 *   confidence: low
 */
/* func_0207da1c (main, class A, 0x2c) — leaf bitfield-extract accessor.
 *   ldrh r2,[r1,#2]; add r3,r1,#0x10; mov r2,r2,asr#8; and r2,r2,#0x7f;
 *   mov r2,r2,lsl#0x10; sub r2,r1,r2,lsr#0x10; str r2,[r0];
 *   ldr r1,[r1,#4]; add r1,r1,r3; str r1,[r0,#4]; bx lr
 * Extracts a 7-bit field at bit 8 of the u16 at +2, subtracts it from the
 * base pointer, and writes {base - field, f4 + (base+0x10)} into out.
 * Leaf, no frame -> default .c (mwcc 2.0/sp1p5).
 */

typedef struct {
    char            _pad_00[0x2];
    unsigned short  bits   : 8;     /* +0x02, low 8 bits unused here */
    unsigned short  count  : 7;     /* +0x02, bits 8..14 -> the :7 extract */
    unsigned short  _hi    : 1;
    int             field_04;       /* +0x04 */
} src_0207da1c_t;

typedef struct {
    void           *out0;           /* +0x00 */
    void           *out4;           /* +0x04 */
} dst_0207da1c_t;

void func_0207da1c(dst_0207da1c_t *out, src_0207da1c_t *p) {
    out->out0 = (char *)p - p->count;
    out->out4 = (char *)p + 0x10 + p->field_04;
}
