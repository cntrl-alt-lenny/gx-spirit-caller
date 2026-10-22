extern void func_02001d68(int arg);
extern void *func_0203268c(void);
extern int func_0203320c(int *self);
extern int func_ov004_021d8798(void *a, void *b, int c);
extern int data_021040ac[];
typedef struct { unsigned int pad; unsigned int mode:3; unsigned int rest:29; } Settings;
extern Settings data_02104f4c;
extern int data_ov004_022915e8[];
extern char data_ov004_02209f94[];

static inline int take_flag(char *self) {
    if (*(int *)(self + 0x38) != 0) {
        *(int *)(self + 0x38) = 0;
        return 1;
    }
    return 0;
}
static inline int busy(void) {
    if (data_ov004_022915e8[0] != 0) return 1;
    return 0;
}
int func_ov004_021d40bc(char *self) {
    if (take_flag(self) != 0 && data_021040ac[13] == 1) {
        func_02001d68(1);
        func_ov004_021d8798(data_ov004_022915e8, data_ov004_02209f94, 0x12);
        func_02001d68(data_02104f4c.mode);
    }
    int flag;
    if (data_ov004_022915e8[0] != 0) flag = 1;
    else flag = 0;
    if (flag) return flag;
    {
        if (func_0203320c(func_0203268c()) == 1) {
            *(int *)(self + 0x30) = 3;
            *(int *)(self + 0x38) = 1;
            *(int *)(self + 0x3c) = 0;
            return 0;
        } else {
            *(int *)(self + 0x30) = 2;
            *(int *)(self + 0x38) = 1;
            *(int *)(self + 0x3c) = 0;
            return 0;
        }
    }
}



