/* CAMPAIGN-PREP candidate for func_0208a764 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     BITFIELD-guard (lsl#31;asr#31) + blx fnptr + globals + cond call
 *   risk:       Bit test uses lsl#31;asr#31 (signed :1 / `(x<<31)>>31`) not `and #1` — may emit `and` instead; func_0208a728 sig int* vs ctrl_t*; offsets +0x110/+0x164 guessed.
 *   confidence: low
 */
/* func_0208a764: guarded teardown sequence with a fnptr call (blx) and
 * two list-walk calls keyed on a bit at [+0x110].
 *
 *   r4 = p
 *   r1 = p[0x110]; bit-test via (r1<<31)>>31 (signed) ; if 0 return
 *   func_0208a728(p)
 *   (*(p[0x164]))(p)                        ; blx fnptr at +0x164
 *   func_0208a6b8(data_021a5d30, p)
 *   g = *data_021a5840
 *   if (g != 0) func_0208a6b8(g + 0x4e0, p)
 *   func_0208a8bc(p)
 */

extern int  data_021a5840;        /* global pointer cell */
extern char data_021a5d30[];      /* list/ctx base */
extern void func_0208a728(void *p);
extern void func_0208a6b8(void *ctx, void *key);
extern void func_0208a8bc(void *p);

typedef struct {
    char         _pad_00[0x110];
    int          flags;                  /* +0x110 (bit 0 tested) */
    char         _pad_114[0x164 - 0x114];
    void       (*fn)(void *);            /* +0x164 */
} ctrl_t;

void func_0208a764(ctrl_t *p) {
    int g;

    if (!(p->flags & 1)) return;

    func_0208a728(p);
    p->fn(p);
    func_0208a6b8(data_021a5d30, p);

    g = data_021a5840;
    if (g != 0) {
        func_0208a6b8((char *)g + 0x4e0, p);
    }
    func_0208a8bc(p);
}
