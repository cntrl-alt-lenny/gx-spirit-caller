typedef struct {
    int f0;
    char pad4[8];
    unsigned short fc;
    char pad_e[2];
    int f10;
    char pad14[0x30 - 0x14];
    unsigned short f30;
    unsigned short f32;
    unsigned short f34;
    unsigned short f36;
} State;

extern unsigned short data_021a8390;
extern State data_021a8394;
extern void func_02096228(void);
extern int func_0209640c(int a0, int a1);
extern void func_02096434(int a0, void *cb);
extern void func_0209a534(void);

void func_0209a4a4(void) {
    if (data_021a8390 != 0) {
        return;
    }
    data_021a8390 = 1;
    func_02096228();
    data_021a8394.f32 = 0;
    data_021a8394.f36 = 0;
    data_021a8394.fc = 0;
    data_021a8394.f0 = 0;
    data_021a8394.f10 = 0;
    data_021a8394.f30 = 0;
    data_021a8394.f34 = 0;
    while (func_0209640c(6, 1) == 0) {
    }
    func_02096434(6, func_0209a534);
}
