/* CAMPAIGN-PREP candidate for func_021b1570 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order idx after arg0-copy; if-block not ternary; (n+1)>>1 plain
 *   risk:       orig builds -1 and +1 from a shared 'mov ip,#0' (sub/add); mwcc may instead emit mvn/mov constants, diverging 2-3 setup insns. permuter-class (constant-materialization scheduling).
 *   confidence: med
 */
/* func_ov002_021b1570 : stack u16 buffer fill + 3 calls (class C, decl-order) */

extern void func_ov002_021b1488(int handle, int flag);
extern void func_ov002_0229cd70(void *dst, const void *src, int count);
extern void func_ov002_0229cd1c(void *buf, int nbytes);

void func_ov002_021b1570(int arg0, int arg1, const void *arg2, int arg3)
{
    unsigned short buf[128];   /* 0x100 bytes on stack */
    int idx;

    idx = 1;
    buf[0] = (unsigned short)arg0;
    if (arg1 != -1) {
        buf[idx] = (unsigned short)arg1;
        idx++;
    }
    if (arg3 > 0) {
        func_ov002_0229cd70(&buf[idx], arg2, arg3);
        idx += (arg3 + 1) >> 1;
    }
    func_ov002_021b1488(arg0, 1);
    func_ov002_0229cd1c(buf, idx << 1);
}
