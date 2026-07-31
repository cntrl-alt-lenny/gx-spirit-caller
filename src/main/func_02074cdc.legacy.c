/* func_02074cdc: state-machine step gated on func_02075928(a)'s
 * result -- 9 means immediate success (return 1), 4 skips the retry
 * loop, otherwise retries func_02075928 while target->field_31==0.
 * Once out of the loop, branches on target->field_31: nonzero runs a
 * short cleanup+finalize path, zero runs a longer setup path
 * (including a conditional func_02077c08 call gated on
 * target->field_30). Both paths converge on setting
 * target->field_455=8 and returning 0, unless func_02074ef4(a)
 * signals nonzero along the way (early return 1).
 *
 * legacy (sp2p3) routing: every exit is a separate pop{regs}+bx lr
 * (2-step, Style A) in the .s, not a fused pop{regs,pc} -- see
 * docs/research/style-a-epilogue.md.
 */

typedef struct {
    char pad_00[0x30];
    unsigned char field_30;
    unsigned char field_31;
    char pad_32[0x455 - 0x32];
    unsigned char field_455;
} Target_t;

typedef struct {
    char pad_00[0xc];
    Target_t *target;
    char pad_10[0x18 - 0xc - 4];
    unsigned short field_18;
    int field_1c;
} Obj_02074cdc_t;

extern int func_020751e4(Obj_02074cdc_t *a);
extern int func_02075928(Obj_02074cdc_t *a);
extern int func_0207655c(Target_t *t);
extern int func_02074ef4(Obj_02074cdc_t *a);
extern int func_02075394(Obj_02074cdc_t *a);
extern int func_02074f2c(Obj_02074cdc_t *a);
extern int func_02076764(Target_t *t);
extern int func_02077c08(Target_t *t, int field_1c, unsigned short field_18);

int func_02074cdc(Obj_02074cdc_t *a) {
    Target_t *t = a->target;
    int result;

    func_020751e4(a);

L_594:
    result = func_02075928(a);
    if (result == 9) {
        return 1;
    }
    if (result == 4) {
        goto L_5c4;
    }
    if (t->field_31 == 0) {
        goto L_594;
    }

L_5c4:
    if (t->field_31 == 0) {
        goto L_600;
    }

    func_0207655c(t);
    if (func_02074ef4(a) != 0) {
        return 1;
    }
    func_02075394(a);
    goto L_658;

L_600:
    func_02074f2c(a);
    func_02076764(t);
    if (t->field_30 != 0) {
        func_02077c08(t, a->field_1c, a->field_18);
    }

    func_0207655c(t);
    func_02075394(a);
    if (func_02074ef4(a) != 0) {
        return 1;
    }

L_658:
    t->field_455 = 8;
    return 0;
}
