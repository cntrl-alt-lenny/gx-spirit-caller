/* CAMPAIGN-PREP candidate for func_02066ea0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     SETTER + byte-copy store-order (dst[1..4]=src[0..3], dst[0]=arg)
 *   risk:       Compiler may coalesce 4 byte loads/stores into word ops, or pick a different base reg than the `add lr,r0,#1` reuse; field +0x800 = 5.
 *   confidence: med
 */
/* func_02066ea0: store byte arg at dst[0]; copy 4 bytes src[0..3] to
 * dst[1..4]; write 5 to field at +0x800. Byte-wise to match the
 * per-byte ldrb/strb sequence (base reused as dst+1). */

typedef struct {
    unsigned char b[5];        /* +0x00..+0x04 */
    char          _pad[0x800 - 5];
    int           f_800;       /* +0x800 */
} obj_02066ea0_t;

void func_02066ea0(obj_02066ea0_t *dst, unsigned char tag, const unsigned char *src) {
    dst->b[0] = tag;
    dst->b[1] = src[0];
    dst->b[2] = src[1];
    dst->b[3] = src[2];
    dst->b[4] = src[3];
    dst->f_800 = 5;
}
