/* CAMPAIGN-PREP candidate for func_0229d820 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS D store-order: nibble|9 then f_00 then |0x10 then f_c=0x400 f_10=0x200; consts 0x400/0x200 preloaded as r3/r1
 *   risk:       asm preloads 0x400(r3)/0x200(r1) BEFORE the attr RMW and orders stores f_14,f_00,f_14|0x10,f_c,f_10; if mwcc materializes the consts late or reorders the field stores, schedule diverges. reshape-able (store-order), struct-guessed
 *   confidence: med
 */
/* func_ov002_0229d820: build one OBJ entry with constant fields.
 * handle = func_02006c0c(data_022cba18, 4, 0); fill 0x28 local; patch attr
 * +0x14 nibble->9 then |0x10; f_0=handle; f_c=0x400; f_10=0x200; register;
 * commit. void. */
extern void *func_02006c0c(void *t, int n, int m);
extern void  func_0201d47c(void *p);
extern void  func_0201e5b8(void *p);
extern void  func_02006e1c(void *h);
extern char  data_ov002_022cba18[];

typedef struct {
    void           *f_00;
    char            _pad04[0x8];
    int             f_0c;
    short           f_10;
    char            _pad12[0x2];
    unsigned short  f_14;
} Oam_d820;

void func_ov002_0229d820(void) {
    Oam_d820 oam;
    void *h = func_02006c0c(data_ov002_022cba18, 4, 0);
    func_0201d47c(&oam);
    oam.f_14 = (oam.f_14 & ~0xf) | 0x9;
    oam.f_00 = h;
    oam.f_14 = oam.f_14 | 0x10;
    oam.f_0c = 0x400;
    oam.f_10 = 0x200;
    func_0201e5b8(&oam);
    func_02006e1c(h);
}
