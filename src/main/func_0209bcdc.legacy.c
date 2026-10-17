typedef struct {
    int f0;
    int f4;
    int f8;
    int fc;
    char pad10[0x1c - 0x10];
    int f1c;
} State;

extern unsigned short data_021a8434;
extern State data_021a8438;
extern void func_02096228(void);
extern int func_0209640c(int a0, int a1);
extern void func_02096434(int a0, void *cb);
extern void func_0209b5e0(void);

void func_0209bcdc(void) {
    if (data_021a8434 != 0) {
        return;
    }
    data_021a8434 = 1;
    data_021a8438.f0 = 0;
    data_021a8438.f4 = 0;
    data_021a8438.f1c = 0;
    data_021a8438.f8 = 0;
    data_021a8438.fc = 0;
    func_02096228();
    while (func_0209640c(5, 1) == 0) {
    }
    func_02096434(5, func_0209b5e0);
}
