/* CAMPAIGN-PREP candidate for func_022926f8 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     guard-chain calls, fn-ptr arg, callback, bool tail
 *   risk:       func_0202e258 is fn-ptr 2nd arg (confirmed sig); tail func_02291160(self,arg1) arg shape assumed
 *   confidence: med
 */
/* func_ov002_022926f8: if(helper1(bit0,fn)==0) return 0; if(helper2(bit0)<=0) return 0; return tail(self,arg1). */

struct F022926f8_F2 { unsigned short bit0 : 1; unsigned short rest : 15; };
struct F022926f8_Self { unsigned short f0; struct F022926f8_F2 f2; };

extern void func_0202e258(void);
extern int func_ov002_021bc000(int bit, void *fn);
extern int func_ov002_02280980(unsigned int bit);
extern int func_ov002_02291160(struct F022926f8_Self *self, int arg1);

int func_ov002_022926f8(struct F022926f8_Self *self, int arg1) {
    if (func_ov002_021bc000(self->f2.bit0, (void *)func_0202e258) == 0)
        return 0;
    if (func_ov002_02280980(self->f2.bit0) <= 0)
        return 0;
    return func_ov002_02291160(self, arg1);
}
