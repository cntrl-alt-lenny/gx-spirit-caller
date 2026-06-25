/* CAMPAIGN-PREP candidate for func_0207e594 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     self-relative reloc adds; bind img in r5; counted u16 loop; halfword zero-extend
 *   risk:       loop counter: orig does (i+1)<<16>>16 zero-extend each iter and reloads ldrh count inside loop; if mwcc keeps i in 32-bit reg or hoists count load, the lsl/lsr#0x10 + reload diverge. permuter-class (loop reg-alloc/zero-extend).
 *   confidence: low
 */
#include <stdint.h>

typedef struct {
    uint16_t count;
    int reloc4;
    int field8;
    int fieldc;
    int field10;
    int field14;
} Img;

extern int func_0207e638(Img *base, int idx);
extern void func_0207e6ac(int p);
extern int func_0207e6bc(void);

void func_0207e594(Img *img) {
    int delta;
    int i;
    int *p;

    img->reloc4 += (int)img;
    delta = func_0207e6bc();
    for (i = 0; i < img->count; i++) {
        p = (int *)func_0207e638(img, i);
        p[1] += delta;
    }
    if (img->fieldc != 0) {
        img->fieldc += (int)img;
        p = (int *)img->fieldc;
        p[1] += (int)img;
    }
    if (img->field10 != 0) {
        img->field10 += (int)img;
        func_0207e6ac(img->field10);
    }
}
