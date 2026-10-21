typedef struct {
    char pad0[0x10];
    unsigned int field_10;
    char pad1[0x28];
    unsigned int field_3c;
} State;
extern State data_02191f40;
extern char data_02193380[];
extern char data_02193320[];
extern void func_0201ff98(void *event);
extern void func_0201f19c(int arg);
/* The existing void definition omits the status return consumed here. */
extern int func_0209f404(int a0, int a1, int a2, int a3, unsigned short a4, unsigned short a5);
int func_0201ff2c(void) {
    int result;
    result = func_0209f404((int)func_0201ff98, (int)data_02193380,
        (unsigned short)data_02191f40.field_10, (int)data_02193320,
        (unsigned short)data_02191f40.field_3c, 1);
    if (result == 2) return 1;
    func_0201f19c(result);
    return 0;
}

