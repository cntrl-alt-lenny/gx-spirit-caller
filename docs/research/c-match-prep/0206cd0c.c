/* CAMPAIGN-PREP candidate for func_0206cd0c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     field compare guard (movlt) + signed-fail guard (mvneq -33) + tail call
 *   risk:       u16 vs int compare order; func ptr literal (&func_0206ccfc) reloc; result-in-r4 reorder; offsets 0x64/0xf8/0xfc guessed
 *   confidence: med
 */
/* func_0206cd0c: q=p->_64; if (q->_f8 < q->_fc) return 0;
 * r=func_0206bf94(func_0206ccfc, p, 0); if (r == 0) return -33;
 * return func_0206be54(p).
 */

typedef struct Obj Obj;

extern int  func_0206bf94(void *fn, Obj *p, int x);
extern int  func_0206be54(Obj *p);
extern void func_0206ccfc(void);

typedef struct {
    char _pad_00[0xf8];
    int            f_f8;   /* +0xf8 */
    unsigned short f_fc;   /* +0xfc */
} Sub;

struct Obj {
    char _pad_00[0x64];
    Sub *sub;              /* +0x64 */
};

int func_0206cd0c(Obj *p) {
    Sub *q = p->sub;
    int r;
    if (q->f_f8 < q->f_fc)
        return 0;
    r = func_0206bf94((void *)func_0206ccfc, p, 0);
    if (r == 0)
        return ~0x20;
    return func_0206be54(p);
}
