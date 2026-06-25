/* CAMPAIGN-PREP candidate for func_0209c0dc (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D store-order: emit field stores in asm order; reload 0x14/0x110 into 0x10/0x10c as written
 *   risk:       arg marshalling of func_02091d24 (two stacked args at [sp],[sp+4] = 0x400 and field 0x108) and store-vs-reload order. struct-guessed offsets + permuter-class arg-reg scheduling; reshape store order if it reorders.
 *   confidence: low
 */
/* func_0209c0dc: init many fields of the system struct, several setup calls; bail when *0x027ffc40==2. */

extern char *data_021a84c0;
extern char *data_021a8460;
extern char *data_021a8ae0;
extern void func_020919d8(void *p);
extern void func_02091d24(void *p, void *cb, void *arg, int a, int b, int c);
extern void func_02092904(void *p, int n);
extern void func_02094504(void *p);
extern void func_02094688(void *dst, void *src, int n);
extern void func_02096434(int a, void *p);
extern void func_0209c090(int a);
extern void func_0209d3dc(void);
extern void func_0209d438(void);

void func_0209c0dc(void) {
    char *base = data_021a84c0;
    *(int *)(base + 0x8) = ~0x2;
    *(int *)(base + 0xc) = 0;
    *(int *)(base + 0x18) = 0;
    *(void **)(base + 0x0) = (void *)data_021a8460;
    func_02094504((void *)data_021a8460);
    func_02092904((void *)data_021a8460, 0x60);
    if (*(unsigned short *)0x027ffc40 != 2) {
        func_02094688((void *)0x027ffe00, (void *)0x027ffa80, 0x160);
    }
    *(int *)(base + 0x14) = 0;
    *(int *)(base + 0x10) = *(int *)(base + 0x14);
    *(int *)(base + 0x110) = 0;
    *(int *)(base + 0x10c) = *(int *)(base + 0x110);
    *(int *)(base + 0x108) = 4;
    func_02091d24(base + 0x44, func_0209d3dc, (void *)data_021a8ae0,
                  *(int *)(base + 0x108), 0x400, 0);
    func_020919d8(base + 0x44);
    func_02096434(0xb, func_0209d438);
    if (*(unsigned short *)0x027ffc40 == 2)
        return;
    func_0209c090(1);
}
