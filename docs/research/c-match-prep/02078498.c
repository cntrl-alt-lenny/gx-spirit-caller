/* CAMPAIGN-PREP candidate for func_02078498 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     unpack/pack calls + (>>3)&0x3f + if-assign cond-select
 *   risk:       obj_t offsets guessed; func_0207850c arg count/order unverified; sub-sp frame slot may not appear
 *   confidence: med
 */
/* func_02078498: unpack a+0x14 (8B), compute a banked offset from a's
 * 0x18 field, run two func_0207850c copies, then pack a back into b.
 * The offset is an if/else cond-select (rsblt/rsbge), NOT a ternary.
 */

extern void func_02078d30(void *dst, const void *src, int nbytes);
extern void func_0207850c(void *a, const void *src, int n);

typedef struct {
    unsigned char _pad_00[0x14];
    unsigned char body[0x04];   /* +0x14 (unpack target / 8B span) */
    unsigned int  flags;        /* +0x18 */
} obj_t;

extern unsigned char data_021020b4[];

void func_02078498(obj_t *a, void *b) {
    int v = (a->flags >> 3) & 0x3f;
    int off;

    func_02078d30(b, &a->body[0], 8);

    if (v < 0x38)
        off = 0x38 - v;
    else
        off = 0x78 - v;

    func_0207850c(a, data_021020b4, off);
    func_0207850c(a, b, 8);
    func_02078d30(b, a, 0x14);
}
