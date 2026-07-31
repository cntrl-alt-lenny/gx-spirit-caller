/* func_0206d96c: validates `a` against several bitfield/state checks
 * (each failing with a distinct negative error code), then dispatches
 * to func_0209268c or func_020927b8 (both on a->field_68+0xe0)
 * depending on a mix of the 6th argument's bit 2 and a->field_72,
 * before finally calling func_0206d854(a,b,c,d,e,dispatch_flag) and
 * returning its result -- with a trailing, result-discarded call to
 * func_02092748(a->field_68+0xe0) squeezed in before the return.
 *
 * legacy (sp2p3) routing: every exit in the .s is a SEPARATE
 * pop{regs} + bx lr (2-step, Style A), not a fused pop{regs,pc} --
 * see docs/research/style-a-epilogue.md.
 *
 * .L_240 and .L_250/.L_26c are each reached from two independent
 * origins in the disassembly -- transcribed with goto (C-55)
 * mirroring the CFG directly rather than reconstructed nesting.
 * The f&4 / field_72 dispatch also needed exact branch-polarity
 * matching (C-55): the fallthrough block is func_0209268c, not
 * func_020927b8 -- a combined `(f&4)||(field_72==0)` if/goto produces
 * the opposite layout. field_70 is read twice in two adjacent ifs
 * (C-51 style, `&4` then `&8`); mwcc CSEs a plain double read into one
 * load, so the volatile cast forces the original's two separate
 * ldrsh instructions. a->field_68+0xe0 is likewise recomputed at
 * each of its 3 use sites rather than cached in one `p`.
 */

typedef struct {
    char pad_00[0x68];
    char *field_68;
    char pad_6c[0x04];
    short field_70;
    signed char field_72;
    signed char field_73;
} Obj_0206d96c_t;

extern int func_0206e4a4(void);
extern int func_0209268c(void *p);
extern int func_020927b8(void *p);
extern int func_02092748(void *p);
extern int func_0206d854(Obj_0206d96c_t *a, int b, int c, int d, int e, int flag);

int func_0206d96c(Obj_0206d96c_t *a, int b, int c, int d, int e, int f) {
    int ok;
    int result;
    void *p;
    int flag;
    char *base68;

    if (func_0206e4a4() != 0) {
        return -0x1c;
    }

    ok = 0;
    if (a != 0) {
        ok = (a->field_70 & 1) != 0;
    }
    if (!ok) {
        return -0x27;
    }

    ok = 1;
    if (a->field_73 == 0) {
        /* ok stays 1 */
    } else if (a->field_73 != 4) {
        ok = 0;
    }
    if (!ok) {
        goto L_250;
    }

    if (!(*(volatile short *) &a->field_70 & 4)) {
        goto L_240;
    }
    if (!(*(volatile short *) &a->field_70 & 8)) {
        goto L_250;
    }

L_240:
    return -0x38;

L_250:
    base68 = a->field_68;

    if (f & 4) {
        goto L_26c;
    }
    if (a->field_72 != 0) {
        goto L_290;
    }

L_26c:
    p = base68 + 0xe0;
    result = func_0209268c(p);
    if (result == 0) {
        return -0x6;
    }
    flag = 0;
    goto L_29c;

L_290:
    p = base68 + 0xe0;
    result = func_020927b8(p);
    flag = 1;

L_29c:
    result = func_0206d854(a, b, c, d, e, flag);
    p = base68 + 0xe0;
    func_02092748(p);
    return result;
}
