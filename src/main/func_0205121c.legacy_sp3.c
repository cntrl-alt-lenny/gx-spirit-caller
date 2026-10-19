extern void *func_020498f0(void);
extern void func_0204f310(int param0, int param1, int param2, int param3);
extern void func_020498dc(int x);
extern int func_0204aaf4(int code);
extern int func_02049038(int id, char *a, char *b);
extern int func_0204ab88(int r4);
extern int func_02051618(int x);
extern int func_0204d284(int x, int y);
/* The existing C definition says void; this caller tests its r0 result. */
extern int func_0204d438(int a0);
typedef struct Obj Obj;
extern Obj *func_02068f78(void *self, int p1, int p2, int p3, int p4, int p5, int p6, int p7, int p8);
extern void func_0204a4f0(int a0, int a1, int a2);
extern char data_020ff9c4[];
#define FIELD(o) (*(int *)((char *)func_020498f0() + (o)))
void func_0205121c(int a0, int a1, int a2, int a3, int a4) {
    func_0204f310(3, 0, a1, a2);
    FIELD(0x46c) = a3;
    FIELD(0x470) = a4;
    *((char *)func_020498f0() + 0x17) = 1;
    FIELD(0x20) = FIELD(0x200);
    FIELD(0xf4) = a0;
    func_020498dc(4);
    if (FIELD(0xe4) == 0) {
        FIELD(0xe4) = (int)func_02068f78(*(void **)((char *)func_020498f0() + 0x2f4), FIELD(0x2f4), FIELD(0x2f8), 0, 20, 1, 0, (int)func_0204a4f0, 0);
    }
    if (FIELD(0xe4) == 0) {
        if (func_0204aaf4(5) != 0) return;
    }
    if (func_0204ab88(func_02049038(5, data_020ff9c4, 0)) != 0) return;
    if (FIELD(0x10) == 0) {
        if (func_02051618(FIELD(0x200)) != 0) return;
    }
    if (func_0204d438(func_0204d284(FIELD(0xf4), 0)) != 0) return;
}

