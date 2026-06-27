/* CAMPAIGN-PREP candidate for func_0228dabc (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind held p/r post-call; held a across 2nd call; ternary for tag, if-assign for >0 clamp
 *   risk:       the (id!=0x139c)?1:0 must stay a ternary (movne;moveq) while the v>0 clamp must be if-assign (movgt) and the final 'add r0,tag,v' operand order (tag first); any mwcc reshuffle of this mixed predication, or recomputing p/r instead of reusing, diverges. mostly reshape-able; the buf[]+a reg-alloc is permuter-class.
 *   confidence: med
 */
/* func_ov002_0228dabc: two calls + arithmetic combine, decl-order sensitive
 * (cls C). a = func_021c8470(cd3f4[0], cd3f4[7]); fill a 0x2c stack buf via
 * func_0227b090(arg0,arg1,&buf); read tile u16 from cf1a2 (player/row offs);
 * if tile!=0: id = slot.id; return ((id!=0x139c)?1:0) + ( min((buf[6]+1)-a,0)
 * +1 ); else return (buf[5]-a)*2. The post-call player(r3)/row(r2) offsets are
 * computed ONCE and reused for cf1a2 and cf16c -> bind p,r. Result-vs-1 is a
 * TERNARY (movne;moveq); the >0 clamp is an if-assign (movgt). a is held
 * across the 2nd call -> declare it before the buf fill. */
typedef unsigned short u16;
struct Ov002Slot { unsigned int id : 13; };
extern char data_ov002_022cd3f4[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a2[];
extern int  func_ov002_021c8470(int a, int b);
extern void func_ov002_0227b090(int arg0, int arg1, void *out);

int func_ov002_0228dabc(int arg0, int arg1) {
    int buf[11];
    int a;
    int p, r;
    int tile;
    unsigned int id;
    int v;
    a = func_ov002_021c8470(*(int *)data_ov002_022cd3f4,
                            *(int *)(data_ov002_022cd3f4 + 0x1c));
    func_ov002_0227b090(arg0, arg1, buf);
    p = (arg0 & 1) * 0x868;
    r = arg1 * 0x14;
    tile = *(u16 *)(data_ov002_022cf1a2 + p + r);
    if (tile != 0) {
        id = ((struct Ov002Slot *)(data_ov002_022cf16c + p + r + 0x30))->id;
        v = buf[6] + 1 - a;
        if (v > 0) v = 0;
        v = v + 1;
        return ((id != 0x139c) ? 1 : 0) + v;
    }
    return (buf[5] - a) * 2;
}
