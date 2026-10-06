typedef struct {
    int x0;
    char _pad4[0x48];
    int x4c;
    int x50;
} State;

extern State data_0219e474;
extern char data_0219e478[];
extern char data_0219e480[];
extern void func_02054ca8(int a, void *b, int c, int d, void *e, int f);
extern int func_02055330(void);

void func_02053a64(void) {
    func_02054ca8(data_0219e474.x0, data_0219e480, data_0219e474.x4c, 0, data_0219e478, 8);
    data_0219e474.x50 = func_02055330();
}
