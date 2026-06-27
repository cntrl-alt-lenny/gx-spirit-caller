/* CAMPAIGN-PREP candidate for func_0204706c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     clamp via if-assign not min; double func_020459c4 call (no CSE); lsl#1 index
 *   risk:       orig calls func_020459c4 TWICE (movhi clamp path) and reloads data_0219daec each use; if mwcc CSEs either, diverges. reshape-able if so; else permuter-class for the cmp/movhi r5 ordering.
 *   confidence: med
 */
/* func_0204706c - main - class C
 * arg0==0 early-out, guard, clamp index 0x19, lsl#1 index store
 * _LIT0 = data_0219daec : global pointer to control struct
 * _LIT1 = 0xffff1596 : literal int arg to func_020480b4
 */
typedef struct {
    unsigned char _pad24[0x24];
    int f24;            /* +0x24 */
    unsigned char _pad2e[0x2e - 0x28];
    unsigned short f2e[0x20];   /* +0x2e : u16 array, lsl#1 index */
    unsigned char _pad68[0x68 - 0x6e];
    int f68;            /* +0x68 */
    int f70;            /* +0x70 */
    int f74;            /* +0x74 */
} Ctrl;

extern Ctrl *data_0219daec;
extern int  func_02045280(void);
extern int  func_02045678(void);
extern int  func_020459c4(void *p);
extern void func_020466f4(int x);
extern void func_020480b4(int x);
extern void func_0205396c(int x);
extern void func_0209448c(void *dst, int v, int n);
extern void func_020944a4(void *p, void *dst, int idx2);

int func_0204706c(unsigned short *a0, int a1, int a2, int a3)
{
    Ctrl *g;
    int idx;

    if (a0 == 0)
        return 0;
    if (func_02045280() != 0)
        return 0;
    g = data_0219daec;
    if (g->f24 != 0)
        return 0;

    g->f70 = a2;
    data_0219daec->f74 = a3;

    if (a0 != 0 && *a0 != 0) {
        func_0209448c((char *)data_0219daec->f2e + 0, 0, 0x34);
        if (func_020459c4(a0) > 0x19)
            idx = 0x19;
        else
            idx = func_020459c4(a0);
        func_020944a4(a0, (char *)data_0219daec->f2e + 0, idx << 1);
    } else {
        idx = 0;
    }

    data_0219daec->f2e[idx] = 0;
    if (func_02045678() == 4) {
        func_020466f4(1);
        func_0205396c(data_0219daec->f68);
        return 1;
    }
    func_020480b4(0xffff1596);
    return 1;
}
