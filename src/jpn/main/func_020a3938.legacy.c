typedef struct {
    char pad_500[0x526];
    unsigned short field_526;
    char pad_528[0x5e4 - 0x528];
    int field_5e4;
} data_021a98f8_t;
extern data_021a98f8_t *data_021a9818;

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int state);
extern int func_020a5784(void);
extern void func_020a5574(void *fn);
extern int func_020a39cc(void);
extern void func_020a39c0(void);

int func_020a3938(void) {
    int result = 1;
    int saved = OS_DisableIrq();

    if (data_021a9818->field_526 == 0) {
        data_021a9818->field_5e4 = 0;
        data_021a9818->field_526 = 1;
        if (func_020a5784() != 0) {
            func_020a5574(func_020a39c0);
            result = 0;
        } else {
            result = func_020a39cc();
        }
    }
    OS_RestoreIrq(saved);
    return result;
}
