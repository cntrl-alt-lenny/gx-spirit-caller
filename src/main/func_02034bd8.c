typedef struct {
    char           _pad[0x12];
    unsigned short flags;
} info_02034bd8_t;

extern info_02034bd8_t data_0219b2e0;
extern void func_02034b2c(void);
extern void func_02036590(unsigned int addr, int size);
extern int func_02037328(int a);

void func_02034bd8(int a) {
    if (!(data_0219b2e0.flags & 0x8000)) {
        return;
    }
    if (a != 0 || func_02037328(0) == 0) {
        func_02034b2c();
        return;
    }
    func_02036590(0x08f00004, 0x10);
    data_0219b2e0.flags |= 0x2000;
}
