typedef struct {
    char pad[0x3c];
    int field3c;
    char pad2[0xb64 - 0x40];
    int field0xb64;
} Data02000e70;

extern Data02000e70 data_021040ac;
extern void SysWork_ClearField0x810(void);
extern void func_02000e34(void);
extern int func_02000d9c(void);
extern void func_02000ec8(void);

void func_02000e70(void) {
    Data02000e70 *p = &data_021040ac;
    SysWork_ClearField0x810();
    switch (p->field3c) {
    case 0:
        func_02000e34();
        break;
    case 1:
        if (func_02000d9c() == 0) {
            p->field0xb64 = 5;
        }
        break;
    case 2:
        func_02000ec8();
        break;
    }
}
