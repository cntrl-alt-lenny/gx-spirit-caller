/* CAMPAIGN-PREP candidate for func_021b1f28 (ov008, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     re-read base each step but cache once in de94 block; signed >= wrap; unsigned >0x8c (bls)
 *   risk:       The de94 marshal block caches base in ip across 4 uses while neighbors re-read; if mwcc caches everywhere (or re-reads inside the block) the ldr count diverges. reshape-able via the explicit `p = *data` local scoped to the block; the >0x8c must stay unsigned (bls).
 *   confidence: med
 */
/* func_ov008_021b1f28 (ov008, class C): counter inc + wrap + marshal, straightline.
 * Base *data_ov008_021b270c is RE-READ each step (asm reloads ldr rX,[r0]) EXCEPT
 * inside the func_0208de94 marshal block, where it is cached once into ip (ldr ip,[r1]).
 * Wrap is signed (movge): if (f20 >= f18 + 0x60) f20 = 0. Tail always calls
 * func_ov008_021b1d08(f5c). func_02005088 takes 4 reg + 2 stack args. */

extern char data_ov008_021b270c[];

extern void      func_02001e5c_void(void);
extern int       func_02001e5c(void *a);
extern void      func_02005088(void *a, int b, int c, int d, int e, int f);
extern int       func_0208de94(void);
extern void      func_ov008_021b1d08(int a);

void func_ov008_021b1f28(void) {
    int r;
    int *p;

    (*(int **)data_ov008_021b270c)[0x24 / 4] += 1;
    (*(int **)data_ov008_021b270c)[0x20 / 4] += 1;
    if ((*(int **)data_ov008_021b270c)[0x20 / 4] >=
        (*(int **)data_ov008_021b270c)[0x18 / 4] + 0x60) {
        (*(int **)data_ov008_021b270c)[0x20 / 4] = 0;
    }

    if ((*(int **)data_ov008_021b270c)[0x68 / 4] != 0) {
        r = func_0208de94();
        p = *(int **)data_ov008_021b270c;                 /* cached ip */
        func_02005088((char *)p + 0x28,
                      *(int *)((char *)p + 0x50),
                      r + 0x24e0,
                      6,
                      *(int *)((char *)p + 0x34),
                      0xc);
        if (func_02001e5c((char *)*(int **)data_ov008_021b270c + 0x28) != 0) {
            (*(int **)data_ov008_021b270c)[0x68 / 4] = 0;
        } else if ((unsigned)(*(int **)data_ov008_021b270c)[0x34 / 4] > 0x8c) {
            (*(int **)data_ov008_021b270c)[0x5c / 4] = 1;
            (*(int **)data_ov008_021b270c)[0x68 / 4] = 0;
        }
    }

    func_ov008_021b1d08((*(int **)data_ov008_021b270c)[0x5c / 4]);
}
