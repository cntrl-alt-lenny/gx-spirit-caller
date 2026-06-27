/* CAMPAIGN-PREP candidate for func_02095a50 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D store-order: mla free-list init loop (add-first do-while) + 10 literal-pool global stores in asm order
 *   risk:       reshape-able/permuter: (1) loop `cmp r4,#0xff` is scheduled before `str r2,[r3],#0x18` — needs the post-store check do-while; (2) the 10 global stores must keep asm order. mwcc may reload pool addrs differently. struct-guessed ret->f4/f8.
 *   confidence: low
 */
/* CAMPAIGN-PREP candidate for func_02095a50 (main, class D, MED tier).
 * UNVERIFIED + ITERATION-EXPECTED.
 *   recipe: mla free-list build (do{i++; *p=base+i*0x18; p+=0x18;}while(i<0xff)) + ordered global stores.
 *   risk:   permuter/store-order: loop cmp-before-str + 10 literal-pool stores in exact asm order.
 *   confidence: low
 */
/* func_02095a50: system init. Build a 255-node free list (stride 0x18, each
 * node -> next) rooted at data_021a6a20 (head ptr in data_021a674c); zero a
 * block of globals, set two flags/ptrs; run subsystem inits; if func_02095880
 * returns a record, fill ->f4=0x1d, ->f8=data_021a8280, finalize. */

extern char data_021a6a20[];
extern char data_021a7a20[];
extern void *data_021a674c;
extern int  data_021a6750;
extern int  data_021a6754;
extern int  data_021a6758;
extern void *data_021a675c;
extern int  data_021a6760;
extern int  data_021a6764;
extern int  data_021a6768;
extern int  data_021a676c;
extern char data_021a67a0[];
extern char data_021a8208[];
extern void *data_021a8280;

extern void func_02095418(void);
extern void func_02095c48(void);
extern void *func_02095880(int);
extern void func_02095838(void);
extern void func_02095678(int);

void func_02095a50(void) {
    char *base = data_021a6a20;
    char **p = (char **)base;
    int i = 0;
    void *r;

    func_02095418();
    data_021a674c = base;
    do {
        i++;
        *p = base + i * 0x18;
        p = (char **)((char *)p + 0x18);
    } while (i < 0xff);

    data_021a675c = data_021a8208;
    *(int *)(data_021a7a20 + 0x7e8) = 0;
    data_021a6754 = 0;
    data_021a6758 = 0;
    data_021a6768 = 0;
    data_021a6760 = 0;
    data_021a6764 = 0;
    data_021a676c = 1;
    data_021a6750 = 0;
    data_021a8280 = data_021a67a0;

    func_02095c48();
    r = func_02095880(1);
    if (r == 0)
        return;
    *(int *)((char *)r + 0x4) = 0x1d;
    *(void **)((char *)r + 0x8) = data_021a8280;
    func_02095838();
    func_02095678(1);
}
