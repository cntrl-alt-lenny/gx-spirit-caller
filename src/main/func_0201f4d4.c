typedef struct {
    char pad0[0x10];
    int value;
    char pad1[0x1c];
    int state;
    char pad2[8];
    int extra;
} State;
extern State data_02191f40;
extern char data_02193380[];
extern char data_02193320[];
extern void func_0201f568(void *p);
extern void func_0201f138(int index);
extern void func_0201f19c(int arg);
/* The assembly and neighbouring caller consume this callee's r0 result. */
extern int func_0209f404(int a0, int a1, int a2, int a3, unsigned short a4, unsigned short a5);
int func_0201f4d4(void) {
    int result;
    if (data_02191f40.state == 4 || (unsigned int)data_02191f40.state == 6 || data_02191f40.state == 5) return 1;
    func_0201f138(4);
    result = func_0209f404((int)func_0201f568, (int)data_02193380,
        (unsigned short)data_02191f40.value, (int)data_02193320,
        (unsigned short)data_02191f40.extra, 1);
    if (result == 2) return 1;
    func_0201f19c(result);
    return 0;
}

