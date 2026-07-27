extern int func_02006c0c(void *table, int a, int b);
extern void func_0201d47c(void *buf);
extern void func_0201e5b8(void *buf);
extern void Task_Invoke(int handle);

extern char data_ov002_022cba18[];

void func_ov002_0229d820(void) {
    char local[40];
    int handle = func_02006c0c(data_ov002_022cba18, 4, 0);
    func_0201d47c(local);
    {
        unsigned short flags = *(unsigned short *)(local + 0x14);
        flags = (flags & ~0xf) | 9;
        *(unsigned short *)(local + 0x14) = flags;
    }
    *(int *)(local + 0) = handle;
    {
        unsigned short flags2 = *(unsigned short *)(local + 0x14);
        flags2 |= 0x10;
        *(int *)(local + 0xc) = 0x400;
        *(unsigned short *)(local + 0x14) = flags2;
        *(unsigned short *)(local + 0x10) = 0x200;
    }
    func_0201e5b8(local);
    Task_Invoke(handle);
}
