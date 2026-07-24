typedef struct {
    unsigned int lo9 : 9;
    unsigned int bit9 : 1;
    unsigned int hi22 : 22;
} Field8f8_bits;

typedef struct {
    char pad[0x8f8];
    Field8f8_bits field8f8;
} SysWork0201a3ec;

extern void *GetSystemWork(void);
extern void func_020190c0(void);
extern int func_0201a3b8(void);
extern void func_0200a26c(int);

int func_0201a3ec(void) {
    SysWork0201a3ec *sw = GetSystemWork();
    int result;
    func_020190c0();
    result = func_0201a3b8();
    if (result != 0) {
        if (sw->field8f8.bit9 == 0) {
            sw->field8f8.bit9 = 1;
            func_0200a26c(4);
        }
    }
    return result;
}
