/* CAMPAIGN-PREP candidate for func_022227dc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     packed-word byte temps b1/hh/b0; single mla base (b0&1)*0x868; +0x418+hh*4; f2b0:1 reloaded per guard
 *   risk:       permuter-class: the b1/hh/b0 extraction from 021b947c's return (lsl/lsr/asr temp chain) is reg-alloc/scheduling sensitive; mwcc likely rotates the three temp regs vs orig r1/r3/r2/r5.
 *   confidence: low
 */
/* func_ov002_022227dc: guard via 021bc618/021ca2b8; if h6.hi==1 and the
 * mid-byte of 021b947c()'s packed word == 0xe, and 021c33e4 ok, dispatch a
 * cell command into table data_022cf16c[bank].slot via 0227ac64. */

extern unsigned char data_ov002_022cf16c[];
extern int func_ov002_021b947c(void);
extern int func_ov002_021bc618(int a);
extern int func_ov002_021c33e4(int a, int b, int c);
extern int func_ov002_021ca2b8(int a);
extern int func_ov002_0223def4(void *o, int a);
extern int func_ov002_0227ac64(int a, void *b, int c, int d, int e);

typedef struct Obj {
    unsigned short h0;          /* 0x00 */
    unsigned short f2b0 : 1;    /* 0x02 */
    unsigned short f2b1 : 5;
    unsigned short f2b6 : 6;
    unsigned short f2hi : 4;
    unsigned short pad4;        /* 0x04 */
    unsigned short f6lo : 8;    /* 0x06 */
    unsigned short f6hi : 8;
} Obj;

int func_ov002_022227dc(void *obj) {
    Obj *o = (Obj *)obj;
    int p;
    int b1, b0, hh;

    if (func_ov002_021bc618(o->f2b0) == 0) return 0;
    if (func_ov002_021ca2b8(o->f2b0) == 0) return 0;
    if (o->f6hi != 1) return 0;

    func_ov002_0223def4(obj, 0);
    p = func_ov002_021b947c();
    b1 = ((unsigned short)p >> 8) & 0xff;
    hh = (unsigned short)(p >> 16);
    b0 = p & 0xff;
    if (b1 != 0xe) return 0;

    if (func_ov002_021c33e4(o->f2b0, b0, hh) == 0) return 0;

    func_ov002_0227ac64(o->f2b0,
                        &data_ov002_022cf16c[(b0 & 1) * 0x868 + 0x418 + hh * 4],
                        1, 1, o->h0 << 16);
    return 0x7f;
}
