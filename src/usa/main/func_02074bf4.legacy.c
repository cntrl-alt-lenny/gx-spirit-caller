/* func_02074bf4: state-machine step gated on func_02075840(a)'s
 * result -- 9 means immediate success (return 1), 4 skips the retry
 * loop, otherwise retries func_02075840 while target->field_31==0.
 * Once out of the loop, branches on target->field_31: nonzero runs a
 * short cleanup+finalize path, zero runs a longer setup path
 * (including a conditional func_02077b20 call gated on
 * target->field_30). Both paths converge on setting
 * target->field_455=8 and returning 0, unless func_02074e0c(a)
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

extern int func_020750fc(Obj_02074cdc_t *a);
extern int func_02075840(Obj_02074cdc_t *a);
extern int func_02076474(Target_t *t);
extern int func_02074e0c(Obj_02074cdc_t *a);
extern int func_020752ac(Obj_02074cdc_t *a);
extern int func_02074e44(Obj_02074cdc_t *a);
extern int func_0207667c(Target_t *t);
extern int func_02077b20(Target_t *t, int field_1c, unsigned short field_18);

int func_02074bf4(Obj_02074cdc_t *a) {
    Target_t *t = a->target;
    int result;

    func_020750fc(a);

L_594:
    result = func_02075840(a);
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

    func_02076474(t);
    if (func_02074e0c(a) != 0) {
        return 1;
    }
    func_020752ac(a);
    goto L_658;

L_600:
    func_02074e44(a);
    func_0207667c(t);
    if (t->field_30 != 0) {
        func_02077b20(t, a->field_1c, a->field_18);
    }

    func_02076474(t);
    func_020752ac(a);
    if (func_02074e0c(a) != 0) {
        return 1;
    }

L_658:
    t->field_455 = 8;
    return 0;
}
