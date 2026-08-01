/* func_ov004_021d8648: configure two DS hardware I/O halfwords at
 * 0x0400100a/0x04001008, then fire two func_02006c0c/Task_Invoke tasks
 * (data_ov004_0220a110 kind 6, data_ov004_0220a12c kind 9), then call
 * func_02094550 and clear self->f18. Always returns 1. */
typedef unsigned short u16;

extern void func_0201d47c(void *a);
extern int func_02006c0c(void *a, int b, int c);
extern void func_0201e5b8(void *a);
extern void Task_Invoke(int a);
extern void func_02094550(void *a, void *b, int n);

extern char data_ov004_0220a110[];
extern char data_ov004_0220a12c[];
extern char data_020b4728[];

int func_ov004_021d8648(char *self) {
    volatile u16 *hw1 = (volatile u16 *)0x0400100a;
    volatile u16 *hw2 = (volatile u16 *)0x04001008;

    *hw1 = (*hw1 & 0x43) | 0x218 | 0x8000;
    *hw1 = (*hw1 & ~3) | 1;
    *hw2 = (*hw2 & 0x43) | (0x8218 - 0x200);
    *hw2 = *hw2 & ~3;

    {
        char buf[0x28];
        int k = 0x40;
        func_0201d47c(buf);
        *(int *)(buf + 0) = func_02006c0c(data_ov004_0220a110, 4, 0);
        *(int *)(buf + 0xc) = 0x4020;
        *(u16 *)(buf + 0x14) = (*(u16 *)(buf + 0x14) & ~0xf) | 6;
        *(u16 *)(buf + 0x14) = *(u16 *)(buf + 0x14) & ~0x10;
        *(u16 *)(buf + 0x10) = k;
        *(int *)(buf + 0x8) = k - 0x41;
        func_0201e5b8(buf);
        Task_Invoke(*(int *)(buf + 0));

        {
            int z = 0;
            func_0201d47c(buf);
            *(int *)(buf + 0) = func_02006c0c(data_ov004_0220a12c, 4, 0);
            *(u16 *)(buf + 0x14) = (*(u16 *)(buf + 0x14) & ~0xf) | 9;
            *(int *)(buf + 0xc) = z;
            *(u16 *)(buf + 0x10) = z;
            *(u16 *)(buf + 0x14) = *(u16 *)(buf + 0x14) & ~0x10;
            func_0201e5b8(buf);
            Task_Invoke(*(int *)(buf + 0));
        }
    }
    func_02094550(data_020b4728, (void *)0x05000460, 0x20);
    *(int *)(self + 0x18) = 0;
    return 1;
}
