/* CAMPAIGN-PREP candidate for func_021d0530 (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     early-return on flag==0; signed /2 -> 0x80-w/2; mask <<0x1d>>0x1d for low3
 *   risk:       struct-guessed/reshape-able: arg count of 02004f58 (4 reg + 2 stacked) inferred from str[sp]/[sp+4]; if the (w/2) folds to lsr not asr, write signed temp; decl-order h,base,w matches first-use.
 *   confidence: med
 */
/* func_ov004_021d0530: window/BG setup. a0=flag(r4).
 * Always: 02001d0c(&G, 0x20, 2); 02001d68( (data_02104f4c[1] & 7) ); 0208deec()->+0xda0 fed to
 * 02094504(0,*, 0x800). If flag==0 return. Else h=02002c0c0(flag); base=0208deec();
 * w=02002054a4(h,0xc); x = 0x80 - (w/2 signed); 02004f58(&G,h,base+0xda0, x, [sp]=2,[sp+4]=0xc);
 * 02002e1ac()->+0x280 with 02001e94(&G, *, 0x6d, 1). Class C: signed /2 + decl-order. */
extern char data_02102c90[];
extern char data_02104f4c[];
extern void func_02001d0c(void *g, int a, int b);
extern void func_02001d68(int a);
extern int  func_0208deec(void);
extern void func_02094504(int a, int b, int c);
extern int  func_0202c0c0(int flag);
extern int  func_020054a4(int h, int a);
extern void func_02004f58(void *g, int h, int b, int x, int e, int f);
extern int  func_0208e1ac(void);
extern void func_02001e94(void *g, int b, int c, int d);

void func_ov004_021d0530(int flag) {
    int h;
    int base;
    int w;

    func_02001d0c(data_02102c90, 0x20, 2);
    func_02001d68(((*(int *)(data_02104f4c + 4)) << 0x1d) >> 0x1d);
    func_02094504(0, func_0208deec() + 0xda0, 0x800);
    if (flag == 0)
        return;
    h = func_0202c0c0(flag);
    base = func_0208deec();
    w = func_020054a4(h, 0xc);
    func_02004f58(data_02102c90, h, base + 0xda0, 0x80 - (w / 2), 2, 0xc);
    func_02001e94(data_02102c90, func_0208e1ac() + 0x280, 0x6d, 1);
}
