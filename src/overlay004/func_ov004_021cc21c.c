typedef struct {
    char pad[0x48];
    int active;
    char pad4c[8];
    int count;
} State;
typedef struct { char pad[0xbcc]; signed char value; } Input;
extern Input data_021040ac;
extern char data_02104c7a[];
extern State data_ov004_0220b500;
extern char data_ov004_0220e500[];
extern int func_ov004_021cc0e0(int value);
extern char *func_020aadf8(char *dst, const char *src);
extern void func_02020d00(void *src, int flag);
extern int func_02037208(int a0, int r1, int r2, int r3);
void func_ov004_021cc21c(void) {
    char request[32];
    func_ov004_021cc0e0(1);
    *(int *)request = 3;
    request[8] = data_021040ac.value;
    func_020aadf8(request + 9, data_02104c7a);
    func_02020d00(request, 0);
    data_ov004_0220b500.active = 1;
    ++data_ov004_0220b500.count;
    *(int *)(data_ov004_0220e500 + 0xcd0) = 1;
    func_02037208(0x3a, -1, 0, 1);
}


