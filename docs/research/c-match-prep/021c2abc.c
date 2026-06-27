/* CAMPAIGN-PREP candidate for func_021c2abc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: bit13 parity; :13 id; index*4 slot; strh side-write then count++ in asm store-order
 *   risk:       reshape-able: orig holds r5=cnt-value (ldr before call), r6=base, r4=cf188 across the call, then strh uses r5<<1 and reloads [r4,r6] for the inc; if mwcc reloads the pre-call count or reorders strh vs inc, the side-write/inc sequence diverges.
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021c2abc (ov002, class D, MED tier).
 * UNVERIFIED build-free draft; iteration expected.
 *   sibling of 021c2a40 with a parallel u16 side-array write. self->f0 bit13 -> parity.
 *   base = parity*0x868. slot = cf16c + base + 0x5d0 + cf188[base]*4.
 *   id13 = self->f0 low13; ==0 return. if 0202e2f8(id13)!=0 return.
 *   else 021b91c4(slot,self); then u16 cf8f4[base + cf188[base]*2] = arg1; cf188[base]++.
 *   Store-order: 021b91c4 call, then the strh side-write, then the count increment.
 */
struct SelfA { unsigned int f0; };
extern char data_ov002_022cf16c[];     /* _LIT2 */
extern char data_ov002_022cf188[];     /* _LIT1 : count array */
extern char data_ov002_022cf8f4[];     /* _LIT3 : u16 side array */
extern int  func_0202e2f8(unsigned int id);
extern void func_ov002_021b91c4(int *slot, struct SelfA *self);

void func_ov002_021c2abc(struct SelfA *self, int val)
{
    unsigned int f = self->f0;
    int base = ((f << 0x12) >> 0x1f & 1) * 0x868;
    int *cnt = (int *)((char *)data_ov002_022cf188 + base);
    int n = *cnt;
    int *slot = (int *)((char *)data_ov002_022cf16c + base + 0x5d0) + n;
    unsigned int id = (f << 0x13) >> 0x13;
    if (id == 0)
        return;
    if (func_0202e2f8(id) != 0)
        return;
    func_ov002_021b91c4(slot, self);
    *(unsigned short *)((char *)data_ov002_022cf8f4 + base + n * 2) = (unsigned short)val;
    *cnt = *cnt + 1;
}
