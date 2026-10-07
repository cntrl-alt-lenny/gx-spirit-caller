typedef struct {
    int a;
    int b;
} Pair_02001a34;

typedef struct {
    char pad[0xb4];
    void *f_b4;
} State_02001a34;

extern Pair_02001a34 data_02102d04[];
extern Pair_02001a34 data_020b46e0[];
extern char data_020c3e24[];
extern char data_020c3e34[];
extern State_02001a34 data_02102c7c;
extern void func_02001ba4(void);
extern void func_02098388(void *p);
extern int func_02006c0c(void *buf, int a, int b);
extern int OS_SPrintf(char *buf, const char *fmt, ...);
extern void *Task_PostLocked(int size, int align, int flags);
extern void Task_InvokeLocked(int h);
extern void func_02094550(int a, void *b, int n);

void func_02001a34(int mask) {
    char buf[32];
    char date[0x48];
    int i;
    int h;

    func_02001ba4();
    for (i = 0; i < 5; i++) {
        if ((mask >> i) & 1) {
            func_02098388(date);
            OS_SPrintf(buf, data_020c3e24, data_020b46e0[i].a);
            data_02102d04[i].a = func_02006c0c(buf, 4, 2);
        }
    }
    if (data_02102c7c.f_b4 != 0) {
        return;
    }
    data_02102c7c.f_b4 = Task_PostLocked(0x1000, 4, 2);
    h = func_02006c0c(data_020c3e34, 4, 2);
    func_02094550(h, data_02102c7c.f_b4, 0x1000);
    Task_InvokeLocked(h);
}
