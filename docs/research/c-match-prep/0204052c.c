/* CAMPAIGN-PREP candidate for func_0204052c (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     struct-copy via 4x{4-word}+{2-word} memcpy; blx self->f40 ctor; reload global per block; early-returns =2/0
 *   risk:       INCOMPLETE/struct-guessed: several literal-pool offsets (_LIT3 memset base, _LIT5 stored const, _LIT6 copy dst) are NOT resolvable from the asm alone -- only data_0219d9d4 is in the pool; LIT1/2/3/4/5/6/7 are unknown. The ldmia/stmia 18-word copy + multiple reloaded globals make this permuter-class even after offsets are filled.
 *   confidence: low
 */
/* func_0204052c (C, 336B): big init -- global guard, blx self->f40 ctor, memset/memcpy,
 * 18-word struct copy (ldmia/stmia x4 + x2), func_0204014c, func_02040478.
 * r5=self(arg0), r4=arg1. Returns 2 on early-out, else 0.
 */
extern char data_020fe67c[];
extern char *data_0219d9cc;
extern char *data_0219d9d0;
extern char *data_0219d9d4;
extern int func_0204014c(void);
extern void func_02040478(void);
extern void func_020945f4(void *dst, int val, int n);

struct Self0204052c {
    unsigned int copy[18];               /* +0x00.. copied 18 words (4x4 + 2) into *g+? */
    unsigned char pad[0x40 - 18 * 4 < 0 ? 0 : 0];
    unsigned int (*f40)(void *a, void *b);   /* +0x40 ctor fn ptr (blx r2) */
};

void func_0204052c(int *self, void *arg1) {
    char *g;
    unsigned int (*ctor)(void *, void *);
    int r;
    int i;
    char *dst;
    if (*(int *)data_0219d9d4 != 0) return /*2*/ , (void)2, (void)0, /* placeholder */ ;
    ctor = *(unsigned int (**)(void *, void *))((char *)self + 0x40);
    {
        unsigned int res = ctor((void *)data_0219d9d0, (void *)data_0219d9cc);
        *(unsigned int *)data_0219d9d4 = res;
        if (res == 0) return;
    }
    func_020945f4((void *)data_0219d9cc, 0, /*r2 from pool*/ 0x1c4);
    g = data_0219d9d4;
    *(void **)(*(char **)g + 0x1000 + 0x314) = arg1;
    func_020945f4(*(char **)g + 0x??_LIT3, 0, 0x1c4);
    *(int *)data_020fe67c = 0;
    g = data_0219d9d4;
    *(int *)(*(char **)g + 0x1000 + 0x8) = (int)data_020fe67c /*LIT5*/;
    dst = *(char **)g + 0x??_LIT6;
    for (i = 0; i < 4; i++) {
        ((unsigned int *)dst)[0] = ((unsigned int *)self)[0];
        /* 4 words per iter via ldmia/stmia; modeled as struct copy */
    }
    *(short *)(*(char **)g + 0x1100 + 0xfe) = 0;
    *(char *)(*(char **)g + 0x1000 + 0x20b) = 0;
    r = func_0204014c();
    *(int *)(*(char **)g + 0x1000 + 0x4) = r;
    if (*(int *)(*(char **)g + 0x1000 + 0x4) != 0) return;
    *(int *)/*LIT7*/ data_020fe67c = 0;
    func_02040478();
}
