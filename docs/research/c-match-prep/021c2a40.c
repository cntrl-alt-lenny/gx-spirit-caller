/* CAMPAIGN-PREP candidate for func_021c2a40 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: bit13 parity *0x868; :13 id via lsl/lsr; index*4 append slot; count store-back
 *   risk:       reshape-able: orig builds base offset 0x18 then +0x400 as two adds (matches 0x18+0x400=0x418 kept split) and holds r5=base, r4=cf180 across the post-call reload+inc; if mwcc folds the two adds or recomputes base, add/ldr ordering diverges. f0 cached in r1 (good).
 *   confidence: med
 */
/* CAMPAIGN-PREP candidate for func_ov002_021c2a40 (ov002, class D, MED tier).
 * UNVERIFIED build-free draft; iteration expected.
 *   self->f0: bit13 (lsl#0x12;lsr#0x1f) selects parity p in {0,1}; base = (p*0x868).
 *   slot ptr = cf16c + base + 0x418 + cf180[base]*4 (count-indexed append slot).
 *   guard: id13 = self->f0 low13 (lsl#0x13;lsr#0x13); if id13==0 return.
 *   if func_0202e2f8(id13)!=0 return. else func_ov002_021b91c4(slot,self);
 *   then cf180[base]++ (store back).
 */
struct SelfA { unsigned int f0; };
extern char data_ov002_022cf16c[];     /* _LIT1 */
extern char data_ov002_022cf180[];     /* _LIT2 : count array */
extern int  func_0202e2f8(unsigned int id);
extern void func_ov002_021b91c4(int *slot, struct SelfA *self);

void func_ov002_021c2a40(struct SelfA *self)
{
    unsigned int f = self->f0;
    int base = ((f << 0x12) >> 0x1f & 1) * 0x868;
    int *cnt = (int *)((char *)data_ov002_022cf180 + base);
    int *slot = (int *)((char *)data_ov002_022cf16c + base + 0x18 + 0x400)
              + *cnt;
    unsigned int id = (f << 0x13) >> 0x13;
    if (id == 0)
        return;
    if (func_0202e2f8(id) != 0)
        return;
    func_ov002_021b91c4(slot, self);
    *cnt = *cnt + 1;
}
