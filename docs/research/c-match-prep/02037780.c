/* CAMPAIGN-PREP candidate for func_02037780 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order sl,r9,r8,r7 args; guard chains; ldr [sp,#2c]/#28 stack args; two func_02037414 calls
 *   risk:       struct-guessed/permuter-class: 9 callee-saved regs + two big stack-arg calls; the str r4,[sp]/str r5,[sp] arg packing and r6 guard reuse make register assignment a scheduling coin-flip. Heavy reshape needed and likely escapes to permuter.
 *   confidence: low
 */
extern unsigned char data_0219b2e0[];   /* global state block */
extern void *data_0219b344[];           /* pointer table, indexed lsl#2 */
extern int func_0203624c(void *obj, int x);
extern void *func_02037414(int a, int b, int c, int flags /*+stack*/, int s28);

typedef struct {
    char pad4[0x4];
    short s4;           /* +0x4 */
    char padc[0xc - 0x6];
    unsigned short hc;  /* +0xc */
    char pad12[0x12 - 0xe];
    unsigned short h12; /* +0x12 */
} GS37;

typedef struct {
    char pad5c[0x5c];
    int p5c;            /* +0x5c */
    char pad68[0x68 - 0x60];
    unsigned short h68; /* +0x68 */
} Node37;

int func_02037780(int a, int hi, int flagword, int d, int s28, int s2c) {
    GS37 *g = (GS37 *)data_0219b2e0;
    int ok;
    int local = s2c;
    Node37 *n5;
    Node37 *res;
    if (!(g->h12 & 0x8000)) return 0;
    if (hi < 0 || (flagword & 0x8000)) {
        ok = 0;
    } else {
        ok = 1;
    }
    if (ok) {
        if (((GS37 *)data_0219b2e0)->s4 >= 0) local |= 0x40;
    }
    {
        int idx = ((GS37 *)data_0219b2e0)->s4;
        if (idx >= 0) {
            n5 = (Node37 *)data_0219b344[idx];
            if ((n5->h68 & 0x200) && n5->p5c != 0) {
                func_0203624c(n5, -1);
                n5->p5c = 0;
            }
        }
    }
    res = func_02037414(a, flagword, d, local, s28);
    if (res == 0) return 0;
    if (ok && !(((GS37 *)data_0219b2e0)->hc & 0x80)) {
        Node37 *r2 = func_02037414(-hi, /*_LIT2 const*/ 0, d, 0xa0, s28);
        if (r2 == 0) return (int)res; /* asm returns r0(=0) here */
        res->h68 |= 0x100;
        res->p5c = (int)r2;
        r2->h68 |= 0x200;
        r2->p5c = (int)res;
    }
    return (int)res;
}
