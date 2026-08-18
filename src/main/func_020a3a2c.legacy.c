typedef struct {
    char pad_500[0x526];
    unsigned short field_526;
    char pad_528[0x5e4 - 0x528];
    int field_5e4;
} data_021a98f8_t;
extern data_021a98f8_t *data_021a98f8;

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern int func_020a5878(void);
extern void func_020a5668(void *fn);
extern int func_020a3ac0(void);
extern void func_020a3ab4(void);

int func_020a3a2c(void) {
    int result = 1;
    int saved = OS_DisableIrq();

    if (data_021a98f8->field_526 == 0) {
        data_021a98f8->field_5e4 = 0;
        data_021a98f8->field_526 = 1;
        if (func_020a5878() != 0) {
            func_020a5668(func_020a3ab4);
            result = 0;
        } else {
            result = func_020a3ac0();
        }
    }
    OS_RestoreIrq(saved);
    return result;
}
