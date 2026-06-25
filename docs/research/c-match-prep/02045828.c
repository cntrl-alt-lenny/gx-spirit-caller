/* CAMPAIGN-PREP candidate for func_02045828 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     store-order b8,b9,f0,f4 then g->h4=2; bind base g; mvn via ~const
 *   risk:       store-order: asm writes [sp+8],[sp+9],[sp+0],[sp+4] then strh[g+4]=2 -- mwcc may reorder f0/f4 before the byte fields or sink g->h4 store; reshape-able via statement reorder. struct-guessed offsets.
 *   confidence: med
 */
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    void *f0;
    void *f4;
    u8 b8;
    u8 b9;
    u8 pad[2];
} StackRec;

extern u8 *data_0219dad0;
extern void func_0203cd38(StackRec *p);
extern void func_0204525c(int a, int b);
extern void func_020454cc(void);
extern void func_0204548c(void);
extern void func_020945f4(void *dst, int val, int n);

void func_02045828(void) {
    StackRec s;
    u8 *g;
    g = data_0219dad0;
    if (g == 0) {
        func_0204525c(9, ~3);
        return;
    }
    if (*(u16 *)(g + 0x4) != 1) {
        return;
    }
    func_020945f4(&s, 0, 0xc);
    g = data_0219dad0;
    s.b8 = (u8)*(u16 *)(g + 0x8);
    s.b9 = (u8)*(u16 *)(g + 0xa);
    s.f0 = (void *)func_020454cc;
    s.f4 = (void *)func_0204548c;
    *(u16 *)(g + 0x4) = 2;
    if (func_0203cd38(&s) != 0) {
        return;
    }
    func_0204525c(9, ~5);
}
