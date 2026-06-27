/* CAMPAIGN-PREP candidate for func_02229d00 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reload f2.b0 per use (4 ldrh); cf17c entry-guard; cf16c+(b0&1)*0x868+0x260 base; :13 field arg
 *   risk:       reshape-able: orig RELOADS f2.b0 four times -- if mwcc binds it to one reg, 3 ldrh vanish; ldrh #1 feeds two uses and ldrh #4 feeds both if/else arms (kept as b0a/b0c). Watch mla-vs-mul fusion for the +0x260 base.
 *   confidence: med
 */
/* func_ov002_02229d00 (ov002, class D, MED) brief 498. UNVERIFIED.
 * STORE/RELOAD recipe: self->f2.b0 reloaded (ldrh [r4,#2]) FOUR times -- one per use; DO NOT cache.
 * Decode (r4=self, b0=f2.bit0):
 *   entry=*(int*)((char*)cf17c+(b0&1)*0x868); if(entry==0) goto end;   // ldrh #1
 *   021e2818(b0);   // b0 from ldrh #1
 *   021d87dc(b0);   // ldrh #2
 *   base=*(int*)(cf16c+(b0&1)*0x868+0x260);  // ldrh #3
 *   r=0202df78((base<<19)>>19 {:13}, self->f8);
 *   if(r!=0) 021d8288(b0, cf16c+(b0&1)*0x868+0x260); else 021e13f4(b0,1,0);  // ldrh #4 shared
 *   end: return 0; */
typedef unsigned short u16;
struct F02229d00_F2 { u16 b0 : 1; u16 rest : 15; };
struct F02229d00_Self { u16 f0; struct F02229d00_F2 f2; u16 pad4; u16 f6; u16 f8; };

extern unsigned char data_ov002_022cf16c[];
extern unsigned char data_ov002_022cf17c[];
extern int  func_0202df78(int field13, int f8);
extern void func_ov002_021e2818(int b0);
extern void func_ov002_021d87dc(int b0);
extern void func_ov002_021d8288(int b0, int *ptr);
extern void func_ov002_021e13f4(int b0, int one, int zero);

int func_ov002_02229d00(struct F02229d00_Self *self) {
    int b0a = self->f2.b0;
    if (*(int *)((char *)data_ov002_022cf17c + (b0a & 1) * 0x868) != 0) {
        int base;
        int r;
        int b0c;
        func_ov002_021e2818(b0a);
        func_ov002_021d87dc(self->f2.b0);
        base = *(int *)(data_ov002_022cf16c + (self->f2.b0 & 1) * 0x868 + 0x260);
        r = func_0202df78((int)(((unsigned)base << 0x13) >> 0x13), self->f8);
        b0c = self->f2.b0;
        if (r != 0)
            func_ov002_021d8288(b0c,
                (int *)(data_ov002_022cf16c + (b0c & 1) * 0x868 + 0x260));
        else
            func_ov002_021e13f4(b0c, 1, 0);
    }
    return 0;
}
