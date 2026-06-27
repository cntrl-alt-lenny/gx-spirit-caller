/* CAMPAIGN-PREP candidate for func_021c3d84 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order 3-way swap (tmp<-J; J<-I; I<-tmp) via 021b91c4; countdown i; slotI decremented by 4
 *   risk:       reshape-able: the three 021b91c4 calls must stay in tmp<-J, J<-I, I<-tmp order with slotI in r7 decremented `sub r7,r7,#4` and tmp on stack (sp+0). If mwcc reorders the swap stores or spills tmp differently, args diverge. struct-guessed: +0x120 array.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021c3d84 (ov002, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe:     store-order 3-way swap via stack temp; countdown i=count-1..1; slotI/slotJ swap through tmp
 * func_021c3d84(parity): if func_021c3cc8(parity)!=0 return 0. n=*(cf178+off);
 * if 0 return 0. For i=n-1 down while i>0: j=func_021b00d0(i+1); swap entry[i]
 * and entry[j] (each 4 bytes) using func_021b91c4(dst,src) through a stack tmp.
 * base = cf16c+off+0x120. Returns 1. The `add r0,r6,#1` before 021b00d0 = i+1. */

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int  func_ov002_021c3cc8(int parity);
extern int  func_ov002_021b00d0(int x);
extern void func_ov002_021b91c4(void *dst, void *src);   /* copies 4 bytes */

int func_ov002_021c3d84(int parity) {
    int tmp;
    if (func_ov002_021c3cc8(parity) != 0) return 0;
    {
        int off = (parity & 1) * 0x868;
        int n = *(int *)(data_ov002_022cf178 + off);
        if (n == 0) return 0;
        {
            int i = n - 1;
            if (i > 0) {
                char *base = data_ov002_022cf16c + off + 0x120;
                char *slotI = base + i * 4;
                do {
                    char *slotJ = base + func_ov002_021b00d0(i + 1) * 4;
                    func_ov002_021b91c4(&tmp, slotJ);
                    func_ov002_021b91c4(slotJ, slotI);
                    func_ov002_021b91c4(slotI, &tmp);
                    i--;
                    slotI -= 4;
                } while (i > 0);
            }
        }
    }
    return 1;
}
