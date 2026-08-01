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
extern struct D021a6710 data_021a6710;

extern void func_02093c20(int a, int b, int c, int d);
extern void func_02093dc8(int arg0);
extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int saved);
extern int  func_02090728(int a);
extern void func_020907b4(int a, void (*cb)(void));
extern void func_02090624(int a);
extern void func_020942b0(void);

#define HW_04000600 (*(volatile u32 *)0x04000600)

void func_02094378(int arg0, int arg1, int arg2, FnPtr arg3, int arg4) {
    if (arg2 == 0) {
        if (arg3 == 0) return;
        arg3(arg4);
        return;
    }

    while (((volatile struct D021a6710 *)&data_021a6710)->field_0 != 0) {
    }

    while (!((HW_04000600 & 0x7000000) >> 24 & 0x2)) {
    }

    {
        int saved;

        data_021a6710.field_10 = (int)arg3;
        data_021a6710.field_0 = 1;
        data_021a6710.field_4 = arg0;
        data_021a6710.field_8 = arg1;
        data_021a6710.field_c = arg2;
        data_021a6710.field_14 = arg4;

        func_02093c20(arg0, arg1, arg2, 0);
        func_02093dc8(arg0);

        saved = OS_DisableIrq();
        {
            u32 v = HW_04000600;
            int hi = (int)((v & 0xc0000000u) >> 30);
            data_021a6710.field_18 = hi;
        }
        data_021a6710.field_1c = func_02090728(0x200000);
        HW_04000600 = (HW_04000600 & ~0xc0000000u) | 0x40000000;
        func_020907b4(0x200000, func_020942b0);
        func_02090624(0x200000);
        func_020942b0();
        OS_RestoreIrq(saved);
    }
}
