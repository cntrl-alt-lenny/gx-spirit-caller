/* CAMPAIGN-PREP candidate for func_02237538 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     keep 021b9ecc result in r0 -> 0202eac8(h); inline i*0x14 (don't bind o+i*S); bit0 bitfield; counter loop
 *   risk:       orig keeps i*0x14 as a standalone induction var (r9 += 0x14) SEPARATE from the (bit0&1)*0x868 mla base; if mwcc fuses base+index into one mla or strength-reduces differently the address math diverges. permuter-class (loop reg-alloc + 10 callee regs).
 *   confidence: low
 */
/* func_ov002_02237538: if 02218068(self)!=0 return it; else loop i=0..4: when
 * 021b9ecc(bit0,i) is live, the per-player row[i] +0x38 u16 is set, 0202eac8
 * passes, and 021b90a8(bit0,i) passes, fire 021d5a08(self,bit0,i,f0,2,0). */
typedef unsigned char  u8;
typedef unsigned short u16;

struct Self { u16 f0; struct { u16 b0:1; u16 r:15; } f2; };

extern int  func_ov002_02218068(void *self);
extern int  func_ov002_021b9ecc(int bit, int idx);
extern int  func_0202eac8(int h);
extern int  func_ov002_021b90a8(int bit, int idx);
extern int  func_ov002_021d5a08(void *self, int a1, int a2, int a3, u16 a4, u16 a5);
extern char data_ov002_022cf16c[];

int func_ov002_02237538(void *arg0) {
    struct Self *self = (struct Self *)arg0;
    int i, ret;
    ret = func_ov002_02218068(self);
    if (ret != 0) return ret;
    for (i = 0; i <= 4; i++) {
        int h = func_ov002_021b9ecc(self->f2.b0, i);
        if (h == 0) continue;
        if (*(u16 *)(data_ov002_022cf16c + (self->f2.b0 & 1) * 0x868
                     + i * 0x14 + 0x38) == 0) continue;
        if (func_0202eac8(h) == 0) continue;
        if (func_ov002_021b90a8(self->f2.b0, i) == 0) continue;
        func_ov002_021d5a08(self, self->f2.b0, i, self->f0, 2, 0);
    }
    return ret;
}
