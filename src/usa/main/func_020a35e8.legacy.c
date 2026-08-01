/* func_020a35e8 (main): guard on *data_021a9818's sub-struct (+0x500), then
 * dispatches on x24 (1 or 2) to func_020a36ec with different arg3.
 * Style A epilogue (sub sp #4 + pop{regs,lr}+bx lr) -> legacy tier.
 */

typedef struct {
    char _pad0[0x508];
    /* +0x508 */ int field508;
    /* +0x50c */ unsigned char field50c;
    char _pad50d[0x524 - 0x50d];
    /* +0x524 */ unsigned short x24;
    /* +0x526 */ unsigned short x26;
    /* +0x528 */ unsigned short x28;
    char _pad52a[0x52c - 0x52a];
    /* +0x52c */ unsigned short x2c;
} Base_t;

extern Base_t *data_021a9818;

extern int func_020a36ec(int a, int b, int c, int d, unsigned short e);
extern void func_020a4104(void);

int func_020a35e8(int arg0, int arg1, int arg2) {
    Base_t *base = data_021a9818;
    unsigned short v1 = (unsigned short)arg1;
    unsigned short v2 = (unsigned short)arg2;
    int result;

    if (base->x28 == 0 || base->x26 == 1) {
        return 1;
    }
    if (base->x24 == 1) {
        goto case1;
    }
    if (base->x24 != 2) {
        goto default_case;
    }
    goto case2;

case1: {
        unsigned short arg3 = (base->x2c == 0) ? 0x3e8 : 0;
        result = func_020a36ec(base->field508, arg0, v1, arg3, v2);
        if (result == 2) {
            data_021a9818->field50c = 1;
        }
        if (result == 2) {
            result = 0;
        }
        return result;
    }

case2:
    result = func_020a36ec((int)func_020a4104, arg0, v1, 0, v2);
    if (result == 2) {
        data_021a9818->field50c = 1;
    }
    if (result == 2) {
        result = 0;
    }
    return result;

default_case:
    return 1;
}
