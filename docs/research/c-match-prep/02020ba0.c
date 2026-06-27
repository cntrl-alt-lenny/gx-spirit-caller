/* CAMPAIGN-PREP candidate for func_02020ba0 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: switch([0x40]) dense 0..5 -> cmp#5;addls-pc table; each handler if(h()==0)b84()
 *   risk:       reshape-able: orig pre-loads `mov r0,#3` before the `==6||5||4` test (movs hoist) and emits func_0201f138(3) on BOTH paths; keep both calls. If switch becomes cmp-chain, ensure case0/4 and 1/5 share bodies (jump-table duplicate entries). struct-guessed.
 *   confidence: med
 */
/* func_02020ba0 (class D): two fn-ptr dispatches + switch([0x40]) jump table.
 *   if([0x30]==1){ if([0x38]==0) return; [0x38](&data_020c6840); return; }
 *   if([0x38]!=0) [0x38](&data_020c685c);
 *   if(!([0x30]==6||==5||==4)){ func_0201f138(3); func_02020b84(); return; }
 *   func_0201f138(3);
 *   switch([0x40]) 0..5: 0/4->f724, 1/5->f0188, 2->f6c0, 3->f0130; each: if(h()==0) func_02020b84(); return; default: return
 */
typedef void (*fn38_t)(void *);
typedef struct {
    char    _pad00[0x30];
    int     f30;        /* +0x30 */
    char    _pad34[0x38 - 0x34];
    fn38_t  f38;        /* +0x38 */
    char    _pad3c[0x40 - 0x3c];
    int     f40;        /* +0x40 */
} S2191f40;

extern S2191f40 data_02191f40;
extern void data_020c6840;
extern void data_020c685c;
extern void func_0201f138(int);
extern int  func_0201f6c0(void);
extern int  func_0201f724(void);
extern int  func_02020130(void);
extern int  func_02020188(void);
extern void func_02020b84(void);

void func_02020ba0(void) {
    if (data_02191f40.f30 == 1) {
        if (data_02191f40.f38 != 0)
            data_02191f40.f38(&data_020c6840);
        return;
    }
    if (data_02191f40.f38 != 0)
        data_02191f40.f38(&data_020c685c);
    if (data_02191f40.f30 != 6 && data_02191f40.f30 != 5 && data_02191f40.f30 != 4) {
        func_0201f138(3);
        func_02020b84();
        return;
    }
    func_0201f138(3);
    switch (data_02191f40.f40) {
    case 0:
    case 4:
        if (func_0201f724() == 0) func_02020b84();
        return;
    case 1:
    case 5:
        if (func_02020188() == 0) func_02020b84();
        return;
    case 2:
        if (func_0201f6c0() == 0) func_02020b84();
        return;
    case 3:
        if (func_02020130() == 0) func_02020b84();
        return;
    default:
        return;
    }
}
