/* CAMPAIGN-PREP candidate for func_020a3190 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     reuse loaded f0 as guard-chain default (int punned to ptr); h-before-s order; 6-arg stack marshalling
 *   risk:       struct-guessed/reshape-able: default v=(ptr)g->f0 reuses the already-loaded f0; if mwcc reloads f0 a ldr diverges. f4bc/f4b4 offsets guessed; 6-arg [sp]/[sp+4] push order.
 *   confidence: low
 */
/* func_020a3190 (main, class C) — one-shot init: if uninitialised, allocate +
 * register via a 6-arg call and return 0; otherwise resolve a fallback handle
 * through a guard chain, store it, run a sub-init, and return 1.
 *   no incoming args (operates on global data_021a9850)
 *
 * asm shape:
 *   if (g->f0 == 0) {
 *       int h = func_020a36c8();
 *       int s = func_020a36b4();                          // -> stack arg [sp]
 *       func_020a078c(0, &data_021a9880, 0x70, h, s, 8);  // 8 -> stack arg [sp+4]
 *       return 0;
 *   }
 *   v = g->f0;                                            // reuse loaded f0 as default
 *   if (g->f4 != 0 && g->f4->f4bc != 0) v = g->f4->f4bc;
 *   g->f4 = v;
 *   func_020a32e4();
 *   g->f_e = g->f4->f4b4;   // byte
 *   g->f_c = 2;             // byte
 *   return 1;
 */

typedef struct a3190_sub {
    char _pad[0x4b4];
    unsigned char f4b4;  /* +0x4b4 */
    char _pad2[0x4bc - 0x4b5];
    struct a3190_sub *f4bc; /* +0x4bc */
} a3190_sub;

typedef struct {
    int           f0;    /* +0x00 */
    a3190_sub    *f4;    /* +0x04 */
    char          _pad08[0x0c - 0x08];
    unsigned char fc;    /* +0x0c */
    char          _pad0d;
    unsigned char fe;    /* +0x0e */
} a3190_g;

extern a3190_g data_021a9850;
extern char    data_021a9880[];

extern int  func_020a36c8(void);
extern int  func_020a36b4(void);
extern void func_020a078c(int a, void *b, int c, int d, int e, int f);
extern void func_020a32e4(void);

int func_020a3190(void)
{
    a3190_sub *v;

    if (data_021a9850.f0 == 0) {
        int h = func_020a36c8();
        int s = func_020a36b4();
        func_020a078c(0, data_021a9880, 0x70, h, s, 8);
        return 0;
    }

    v = (a3190_sub *)data_021a9850.f0;
    if (data_021a9850.f4 != 0 && data_021a9850.f4->f4bc != 0)
        v = data_021a9850.f4->f4bc;
    data_021a9850.f4 = v;

    func_020a32e4();
    data_021a9850.fe = data_021a9850.f4->f4b4;
    data_021a9850.fc = 2;
    return 1;
}
