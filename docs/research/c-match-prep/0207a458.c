/* CAMPAIGN-PREP candidate for func_0207a458 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: switch->jump-table, reload global each use (not bound), commutative add base+0x2140 inline
 *   risk:       permuter-class: mov-const scheduling + literal-pool order before bl b13c tail calls; entire sibling family (a334/a544) shipped .s for this exact wall.
 *   confidence: low
 */
/* func_0207a458: jump-table dispatch on msg->kind (u16 @ +2), 5-way.
 * case 1: if g->state(0x2260)==0xc -> set(0xa)+af28; else clear 0x2282,
 *         set(3), b13c(0, g+0x2140, 0, 0x83d).
 * cases 2/4: set(0xa)+af28. default(0,3,...): set(0xb)+b13c(7,g+0x2140,0,0x84f).
 * Sibling family (func_0207a334/0207a544) ships as .s -> reg-alloc/lit-order wall. */
typedef unsigned short u16;
typedef unsigned char  u8;

typedef struct {
    u8   _pad0[0x2260];
    int  state;        /* +0x2260 */
    u8   _pad1[0x1c];
    u16  f2280;        /* +0x2280 */
    u16  f2282;        /* +0x2282 */
} GxState;

typedef struct {
    u16 _r0;
    u16 kind;          /* +0x2 */
} GxMsg;

extern GxState *data_021a088c;
extern void func_0207af28(void);
extern void func_0207b038(int code);
extern void func_0207b13c(int code, void *p, int b, int magic);

void func_0207a458(GxMsg *msg) {
    switch (msg->kind) {
    case 1:
        if (((GxState *)data_021a088c)->state == 0xc) {
            func_0207b038(0xa);
            func_0207af28();
            return;
        }
        ((GxState *)data_021a088c)->f2282 = 0;
        func_0207b038(3);
        func_0207b13c(0, (char *)data_021a088c + 0x2140, 0, 0x83d);
        return;
    case 2:
    case 4:
        func_0207b038(0xa);
        func_0207af28();
        return;
    default:
        func_0207b038(0xb);
        func_0207b13c(7, (char *)data_021a088c + 0x2140, 0, 0x84f);
        return;
    }
}
