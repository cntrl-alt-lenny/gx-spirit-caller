typedef struct {
    int w0;
    char pad4[0x1c];
    int w20;
    char pad24[0x48];
    int w6c;
} State;

typedef struct {
    int f0;
    char pad4[4];
    int f8;
    void *fc;
    unsigned short h10;
    char pad12[2];
    unsigned short h14 : 4;
    char pad16[0x28 - 0x16];
} Req;

extern State data_0219ad48;
extern char *data_020be9ac[];
extern char data_020c6cf8[];
extern int *func_02006c0c(char *a, int b, int c);
extern void Task_Invoke(void *p);
extern void func_0201d47c(void *p);
extern int func_0201d530(int a);
extern void func_0201e5b8(void *p);
extern void OS_SPrintf(char *buf, char *fmt, char *arg);
extern void func_02094504(int v, void *dst, int n);

void func_0202d2dc(int a) {
    Req r;
    char buf[0x20];
    if (data_0219ad48.w20 == a + 0x16) {
        return;
    }
    data_0219ad48.w20 = a + 0x16;
    if (a != 0) {
        OS_SPrintf(buf, data_020c6cf8, data_020be9ac[a - 1]);
        func_0201d47c(&r);
        r.f0 = (int)func_02006c0c(buf, 4, 0);
        r.h14 = data_0219ad48.w6c;
        r.f8 = -1;
        r.fc = (void *)0x2160;
        r.h10 = 0x60;
        func_0201e5b8(&r);
        Task_Invoke((void *)r.f0);
    } else {
        func_02094504(0, (char *)func_0201d530(data_0219ad48.w6c) + 0x2160, 0x80);
    }
}
