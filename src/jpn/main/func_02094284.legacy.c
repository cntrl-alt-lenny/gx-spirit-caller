typedef unsigned int u32;
typedef void (*FnPtr)(int);

struct D021a6710 {
    int field_0;
    int field_4;
    int field_8;
    int field_c;
    int field_10;
    int field_14;
    int field_18;
    int field_1c;
};
extern struct D021a6710 data_021a6630;

extern void func_02093b2c(int a, int b, int c, int d);
extern void func_02093cd4(int arg0);
extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern int  func_02090640(int a);
extern void func_020906cc(int a, void (*cb)(void));
extern void func_0209053c(int a);
extern void func_020941bc(void);

#define HW_04000600 (*(volatile u32 *)0x04000600)

void func_02094284(int arg0, int arg1, int arg2, FnPtr arg3, int arg4) {
    if (arg2 == 0) {
        if (arg3 == 0) return;
        arg3(arg4);
        return;
    }

    while (((volatile struct D021a6710 *)&data_021a6630)->field_0 != 0) {
    }

    while (!((HW_04000600 & 0x7000000) >> 24 & 0x2)) {
    }

    {
        int saved;

        data_021a6630.field_10 = (int)arg3;
        data_021a6630.field_0 = 1;
        data_021a6630.field_4 = arg0;
        data_021a6630.field_8 = arg1;
        data_021a6630.field_c = arg2;
        data_021a6630.field_14 = arg4;

        func_02093b2c(arg0, arg1, arg2, 0);
        func_02093cd4(arg0);

        saved = OS_DisableIrq();
        {
            u32 v = HW_04000600;
            int hi = (int)((v & 0xc0000000u) >> 30);
            data_021a6630.field_18 = hi;
        }
        data_021a6630.field_1c = func_02090640(0x200000);
        HW_04000600 = (HW_04000600 & ~0xc0000000u) | 0x40000000;
        func_020906cc(0x200000, func_020941bc);
        func_0209053c(0x200000);
        func_020941bc();
        OS_RestoreIrq(saved);
    }
}
