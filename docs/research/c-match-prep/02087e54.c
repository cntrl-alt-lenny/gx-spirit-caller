/* CAMPAIGN-PREP candidate for func_02087e54 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard chain + ptr-into-struct arg + shift arg + tail call
 *   risk:       &r3->field_1c vs (char*)+0x1c may differ; field_0 type and offsets guessed
 *   confidence: med
 */
/* func_02087e54: two early-return guards then a tail call passing
 * a pointer into the inner struct (base+0x1c) and (arg1 << 8).
 */

typedef struct InnerE54 {
    char _pad_00[0x1c];
    short field_1c;          /* +0x1c (passed by address) */
} InnerE54;

typedef struct InnerE54Full {
    char _pad_00[0x1c];
    short field_1c;
    char _pad_1e[0x2c - 0x1e];
    unsigned char byte_2c;   /* +0x2c */
} InnerE54Full;

typedef struct EntE54 {
    InnerE54Full *field_0;   /* +0x00 */
} EntE54;

extern void func_0208b0a4(void *p, int v);

void func_02087e54(EntE54 *p, int arg1) {
    InnerE54Full *q = p->field_0;

    if (q == 0) return;
    if (q->byte_2c == 2) return;
    func_0208b0a4(&q->field_1c, arg1 << 8);
}
