/* func_ov004_021d855c: configure two DS hardware I/O halfwords at
 * 0x0400100a/0x04001008, then fire two func_02006bf0/Task_Invoke tasks
 * (data_ov004_02209eb0 kind 6, data_ov004_02209ecc kind 9), then call
 * func_0209445c and clear self->f18. Always returns 1. */
typedef unsigned short u16;

extern void func_0201d428(void *a);
extern int func_02006bf0(void *a, int b, int c);
extern void func_0201e564(void *a);
extern void Task_Invoke(int a);
extern void func_0209445c(void *a, void *b, int n);

extern char data_ov004_02209eb0[];
extern char data_ov004_02209ecc[];
extern char data_020b4634[];

int func_ov004_021d855c(char *self) {
    volatile u16 *hw1 = (volatile u16 *)0x0400100a;
    volatile u16 *hw2 = (volatile u16 *)0x04001008;

    *hw1 = (*hw1 & 0x43) | 0x218 | 0x8000;
    *hw1 = (*hw1 & ~3) | 1;
    *hw2 = (*hw2 & 0x43) | (0x8218 - 0x200);
    *hw2 = *hw2 & ~3;

    {
        char buf[0x28];
        int k = 0x40;
        func_0201d428(buf);
        *(int *)(buf + 0) = func_02006bf0(data_ov004_02209eb0, 4, 0);
        *(int *)(buf + 0xc) = 0x4020;
        *(u16 *)(buf + 0x14) = (*(u16 *)(buf + 0x14) & ~0xf) | 6;
        *(u16 *)(buf + 0x14) = *(u16 *)(buf + 0x14) & ~0x10;
        *(u16 *)(buf + 0x10) = k;
        *(int *)(buf + 0x8) = k - 0x41;
        func_0201e564(buf);
        Task_Invoke(*(int *)(buf + 0));

        {
            int z = 0;
            func_0201d428(buf);
            *(int *)(buf + 0) = func_02006bf0(data_ov004_02209ecc, 4, 0);
            *(u16 *)(buf + 0x14) = (*(u16 *)(buf + 0x14) & ~0xf) | 9;
            *(int *)(buf + 0xc) = z;
            *(u16 *)(buf + 0x10) = z;
            *(u16 *)(buf + 0x14) = *(u16 *)(buf + 0x14) & ~0x10;
            func_0201e564(buf);
            Task_Invoke(*(int *)(buf + 0));
        }
    }
    func_0209445c(data_020b4634, (void *)0x05000460, 0x20);
    *(int *)(self + 0x18) = 0;
    return 1;
}
