/* CAMPAIGN-PREP candidate for func_021c9fcc (ov004, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     struct-assign for ldm/stm 16-byte copy; reload stack-arg a4 thrice; ptrs[] array
 *   risk:       struct-guessed: a4 is the incoming STACK arg [sp,#0xe0], not a4_ param — placeholder access is wrong; also the 6 stack args of func_0201ef90 ordering + a2==1?1:2 ternary are reg-alloc-fragile.
 *   confidence: low
 */
/* func_ov004_021c9fcc (ov004, class C): setup + 4-iter struct-builder + big call.
 * Copy 16-byte template data_02200dbc -> tmpl[4]; loop i:0..3 build 0x20-byte
 * rec[i] via func_02091554(&rec[i], data_02209ad4, a1, tmpl[i]); ptrs[i]=&rec[i].
 * a4 = *(int*)stackarg, reloaded 3x. func_0201ef90(a0+8,a0+0xc,a0+0x10,a3,...)
 * with stack: a4<<9, a2==1?1:2, ptrs, a4>0, 0x200, a0+0x90. Tail: a0[0]=a4,a0[1]=a3. */
extern char data_ov004_02200dbc[];
extern char data_ov004_02209ad4[];
extern void func_ov004_021c9f94(void);
extern void func_02091554(void *out, void *p, int a, int v);
extern void func_0201ef90(void *a, void *b, void *c, int d, int e, int f, void *g, int h, int i, void *j);

typedef struct { int w[4]; } Tmpl16;
typedef struct { char b[0x20]; } Rec32;

void func_ov004_021c9fcc(int a0, int a1, int a2, int a3, int a4_) {
    Tmpl16 tmpl;
    Rec32 rec[4];
    void *ptrs[4];
    int i;
    char *self = (char *)a0;
    (void)a4_;
    func_ov004_021c9f94();
    tmpl = *(Tmpl16 *)data_ov004_02200dbc;
    for (i = 0; i < 4; i++) {
        func_02091554(&rec[i], data_ov004_02209ad4, a1, tmpl.w[i]);
        ptrs[i] = &rec[i];
    }
    {
        int a4 = *(int *)(self + 0xe0 - 0 /*incoming stack arg*/);
        func_0201ef90(self + 8, self + 0xc, self + 0x10, a3,
                      a4 << 9, (a2 == 1) ? 1 : 2, ptrs, (a4 > 0) ? 1 : 0,
                      0x200, self + 0x90);
        *(int *)self = a4;
        *(int *)(self + 4) = a3;
    }
}
