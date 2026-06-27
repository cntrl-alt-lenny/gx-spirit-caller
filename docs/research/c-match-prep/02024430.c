/* CAMPAIGN-PREP candidate for func_02024430 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D/C: stmia template copy; ordered strb/strh/strh/str to cfg; bind a/cfg; dup-pool
 *   risk:       struct-guessed + permuter-class: data_0219a8ec is loaded twice (.L_020244e4 literal alias) — the dup-pool CSE wall again. Also the four data_0219a8f4 stores must keep strb,strh,strh,str order; offsets +0/4/6/1c are inferred — confirm struct.
 *   confidence: low
 */
/* func_02024430: copy a 12-byte (3-word) template from data_020be754 into a
 * stack struct, zero a 0x38 manager (data_0219a8ec, Fill32), store arg0 as
 * saved_arg, and if handle is null allocate via Task_PostLocked(arg0*0x16c,
 * 4, 0). Then write fixed fields into data_0219a8f4 IN SOURCE ORDER
 * (byte 5 @+0, u16 0x80 @+4, u16 0x80 @+6, word 0 @+0x1c) and call
 * func_02026f78(&stack). Returns 1.
 *
 * data_0219a8ec base bound in r4 across Fill32 and the saved_arg/handle
 * accesses. data_0219a8f4 base bound in r5; its four stores MUST keep asm
 * order (strb,strh,strh,str) — do not let the C reorder.
 */

typedef struct { void *handle; int saved_arg; } mgr_0219a8ec_t;

typedef struct {
    unsigned char  f_00;   /* +0x00 */
    char           _p0[3];
    unsigned short f_04;   /* +0x04 */
    unsigned short f_06;   /* +0x06 */
    char           _p1[0x14];
    unsigned int   f_1c;   /* +0x1c */
} cfg_0219a8f4_t;

typedef struct { unsigned int w[3]; } tmpl12_t;

extern tmpl12_t        data_020be754;
extern mgr_0219a8ec_t  data_0219a8ec;        /* slot A (r4) */
extern mgr_0219a8ec_t  data_0219a8ec_alias;  /* slot B (handle test, alias) */
extern cfg_0219a8f4_t  data_0219a8f4;
extern void Fill32(int v, void *dst, int size);
extern void *Task_PostLocked(void *arg0, int arg1, int arg2);
extern void func_02026f78(void *p);

int func_02024430(int arg0) {
    tmpl12_t local = data_020be754;
    mgr_0219a8ec_t *a = &data_0219a8ec;
    cfg_0219a8f4_t *cfg = &data_0219a8f4;
    int size;

    Fill32(0, a, 0x38);
    data_0219a8ec_alias.saved_arg = arg0;
    if (data_0219a8ec_alias.handle == 0) {
        size = a->saved_arg * 0x16c;
        a->handle = Task_PostLocked((void *)size, 4, 0);
        Fill32(0, a->handle, size);
    }

    cfg->f_00 = 5;
    cfg->f_04 = 0x80;
    cfg->f_06 = 0x80;
    cfg->f_1c = 0;
    func_02026f78(&local);
    return 1;
}
