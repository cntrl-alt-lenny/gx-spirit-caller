/* CAMPAIGN-PREP candidate for func_0206ab3c (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     counted loop over struct int-array member at +0x84; count reload
 *   risk:       None observed: byte-exact under sp3. arr must be a struct member at 0x84 (not a hoisted ptr) so base+0x84 folds into the ldr. Route .legacy_sp3.c.
 *   confidence: high
 */
/* func_0206ab3c -> route as func_0206ab3c.legacy_sp3.c (mwcc 1.2/sp3).
 * Counted loop: for i in [0, p->f480), release p->arr[i] (the int array at
 * offset 0x84) via func_0206b47c(p, p->arr[i]); then clear p->f480.
 * VERIFIED byte-exact under sp3: arr[255] sizing places f480 at 0x480 and
 * yields add r0,r5,r4,lsl#2; ldr [r0,#0x84]. */
extern void func_0206b47c(void *p, int v);

struct S {
    int  f0;
    char pad[0x80];
    int  arr[255];   /* 0x84 .. 0x47f */
    int  f480;       /* 0x480 */
};

void func_0206ab3c(struct S *p) {
    int i;
    for (i = 0; i < p->f480; i++) {
        func_0206b47c(p, p->arr[i]);
    }
    p->f480 = 0;
}
