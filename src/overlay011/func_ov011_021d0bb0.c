extern void Fill32(int value, void *dest, int count);
extern void func_ov011_021cc194(void);
extern void func_ov011_021cc27c(void);
extern void func_ov011_021d1434(void *selfv, int mode);
typedef struct {
    char pad[0x19c];
    unsigned int count:8;
    unsigned int active:1;
    unsigned int rest:23;
} State;
extern State data_ov011_021d4660;
void func_ov011_021d0bb0(void *selfv) {
    char *self = selfv;
    Fill32(0, self, 0x28);
    *(void (**)(void))(self + 0x1c) = func_ov011_021cc194;
    *(void (**)(void))(self + 0x20) = func_ov011_021cc27c;
    *(unsigned int *)(self + 0x18) |= 0xe0;
    if (data_ov011_021d4660.active) return;
    data_ov011_021d4660.active = 1;
    func_ov011_021d1434(self, 1);
}
