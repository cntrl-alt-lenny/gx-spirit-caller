/* CAMPAIGN-PREP candidate for func_020879a4 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard + bind-base + reload-byte + field sets (store-order)
 *   risk:       p->field_4 may reload after call instead of binding to r4; field offsets/types guessed
 *   confidence: med
 */
/* func_020879a4: init/guard/call sequence + field sets.
 *   r5=p cached; r4=p->field_4 bound across the first call;
 *   p->byte_3c reloaded for the second call (bind-vs-reload).
 */

typedef struct Obj4 {
    char _pad_00[0x1c];
    int  field_1c;            /* +0x1c */
} Obj4;

typedef struct Ent879a4 {
    char  _pad_00[0x04];
    Obj4 *field_4;            /* +0x04 -> Obj4* */
    char  _pad_08[0x30 - 0x08];
    int   field_30;          /* +0x30 */
    char  _pad_31[0x2c - 0x30 < 0 ? 0 : 0]; /* placeholder */
    /* note: 0x2c < 0x30, so lay them explicitly below */
} Ent879a4_unused;

/* explicit layout (0x2c and 0x2f are bytes BEFORE 0x30) */
typedef struct Ent {
    char  _pad_00[0x04];
    Obj4 *field_4;            /* +0x04 */
    char  _pad_08[0x2c - 0x08];
    unsigned char byte_2c;   /* +0x2c */
    char  _pad_2d[0x2f - 0x2d];
    unsigned char byte_2f;   /* +0x2f */
    int   field_30;          /* +0x30 */
    char  _pad_34[0x3c - 0x34];
    unsigned char byte_3c;   /* +0x3c */
} Ent;

extern void func_0208787c(Ent *p);
extern void func_020950d4(int a, int b);
extern void func_02095270(int a);
extern int  func_020955a8(void);

void func_020879a4(Ent *p) {
    Obj4 *q = p->field_4;

    func_02095270(p->byte_3c);
    if (q->field_1c != 0) {
        func_020950d4(p->byte_3c, 0xffff);
    }
    func_0208787c(p);
    p->field_30 = func_020955a8();
    p->byte_2f = 1;
    p->byte_2c = 1;
}
