/* CAMPAIGN-PREP candidate for func_022563f0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class C+D: id:13 bitfield ==0x1624 (hoisted, non-encodable const in callee reg); two lockstep char* cursors +=0x14; (bit1|bit2)||ce288_484 OR short-circuit; per-outer mla base
 *   risk:       permuter-class: heavy live set (k,j,arg,idp,flp,f40,0x1624,base globals) in a 5-arg-deep guard chain; the callee-reg coloring + whether idp/flp stay separate cursors vs mla-fused is the likely multi-line residue. id==0x1624 cmp operand order is a smaller reshape-able sub-risk (swap to 0x1624==id).
 *   confidence: low
 */
/* func_ov002_022563f0: 2x(j=5..9) nested scan over player (arg&1)'s 0x868
 * block. For k in 0..1: arg = *(int*)(d016c+0xcec) ^ k; b = cf16c +
 * (arg&1)*0x868; cursors idp=b+0x94 (->id:13), flp=b+0x64 (u16@+0x38,
 * u32@+0x40), both stride 0x14; j 5..9. A record qualifies when
 *   id == 0x1624 && f38 != 0 && !((f40>>6)&1) &&
 *   !(((f40>>2)|(f40>>1))&1 && *(int*)(ce288+0x484)==0)
 * then if 021b9e00(arg,j)==0 -> 021de480(arg,j,0,0); return 1. Else 0. */
extern char data_ov002_022d016c[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022ce288[];
extern int  func_ov002_021b9e00(int a, int b);
extern int  func_ov002_021de480(int a, int b, int c, int d);

struct Ov002SlotId { unsigned int id : 13; };

int func_ov002_022563f0(void) {
    int k, j;
    int arg;
    char *b;
    char *idp;
    char *flp;
    unsigned int f40;

    for (k = 0; k < 2; k++) {
        arg = *(int *)(data_ov002_022d016c + 0xcec) ^ k;
        b = data_ov002_022cf16c + (arg & 1) * 0x868;
        idp = b + 0x94;
        flp = b + 0x64;
        for (j = 5; j < 0xa; j++) {
            if (((struct Ov002SlotId *)idp)->id == 0x1624 &&
                *(unsigned short *)(flp + 0x38) != 0 &&
                ((f40 = *(unsigned int *)(flp + 0x40)) >> 6 & 1) == 0) {
                if ((((f40 >> 2) | (f40 >> 1)) & 1) == 0 ||
                    *(int *)(data_ov002_022ce288 + 0x484) != 0) {
                    if (func_ov002_021b9e00(arg, j) == 0) {
                        func_ov002_021de480(arg, j, 0, 0);
                        return 1;
                    }
                }
            }
            idp += 0x14;
            flp += 0x14;
        }
    }
    return 0;
}
