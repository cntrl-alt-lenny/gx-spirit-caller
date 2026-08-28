/* func_0202d370: latch a0 into data_0219ac68.field_1c (no-op if unchanged).
 * If a0==0, tear down via func_0201d4dc/func_02094410. Otherwise format
 * data_020be8d0[a0-1] through data_020c6c30, look up a task id, patch a
 * flags halfword, and invoke the task. */
extern int data_020be8d0[];
extern char data_020c6c30[];
extern void OS_SPrintf(char *buf, const char *fmt, ...);
extern void func_0201d428(void *p);
extern int func_02006bf0(char *s, int a, int b);
extern void func_0201e564(void *p);
extern void Task_Invoke(int task);
extern void *func_0201d4dc(int p);
extern void func_02094410(int a, void *b, int c);

struct S0219ad48 {
    char pad[0x1c];
    int field_1c;
    char pad2[0x6c - 0x1c - 4];
    int field_6c;
};
extern struct S0219ad48 data_0219ac68;

void func_0202d370(int a0) {
    char buf[0x48];
    if (data_0219ac68.field_1c == a0) {
        return;
    }
    data_0219ac68.field_1c = a0;
    if (a0 == 0) {
        goto teardown;
    }
    OS_SPrintf(buf + 0x28, data_020c6c30, data_020be8d0[a0 - 1]);
    func_0201d428(buf);
    *(int *)(buf) = func_02006bf0(buf + 0x28, 4, 0);
    {
        unsigned short ip = *(unsigned short *)(buf + 0x14);
        unsigned short trunc = (unsigned short)data_0219ac68.field_6c;
        ip = (ip & ~0xf) | (trunc & 0xf);
        *(unsigned short *)(buf + 0x14) = ip;
        *(int *)(buf + 8) = -1;
        *(int *)(buf + 0xc) = 0x20e0;
        *(unsigned short *)(buf + 0x10) = 0x40;
    }
    func_0201e564(buf);
    Task_Invoke(*(int *)buf);
    return;
teardown:
    {
        void *p = func_0201d4dc(data_0219ac68.field_6c);
        func_02094410(0, (char *)p + 0xe0 + 0x2000, 0x80);
    }
}
