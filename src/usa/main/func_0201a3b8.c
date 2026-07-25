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
extern void func_0201908c(void);
extern int func_0201a384(void);
extern void func_0200a250(int);

int func_0201a3b8(void) {
    SysWork0201a3ec *sw = GetSystemWork();
    int result;
    func_0201908c();
    result = func_0201a384();
    if (result != 0) {
        if (sw->field8f8.bit9 == 0) {
            sw->field8f8.bit9 = 1;
            func_0200a250(4);
        }
    }
    return result;
}
