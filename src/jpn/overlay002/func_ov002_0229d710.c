extern int func_02006bf0(void *table, int a, int b);
extern void func_0201d428(void *buf);
extern void func_0201e564(void *buf);
extern void Task_Invoke(int handle);

extern char data_ov002_022cb918[];

void func_ov002_0229d710(void) {
    char local[40];
    int handle = func_02006bf0(data_ov002_022cb918, 4, 0);
    func_0201d428(local);
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
    func_0201e564(local);
    Task_Invoke(handle);
}
