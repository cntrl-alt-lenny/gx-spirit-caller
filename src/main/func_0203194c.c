typedef struct {
    unsigned int field_0;
    unsigned int counter;
} state_0203194c_t;

extern state_0203194c_t data_0219adb8;
extern void func_02093bfc(void);

unsigned long long func_0203194c(unsigned int x) {
    unsigned long long r;

    if (((unsigned long long)x & 0xffffffff00000000ull) != 0) {
        func_02093bfc();
    }
    r = ((unsigned long long)data_0219adb8.counter << 28) | (x >> 4);
    data_0219adb8.counter++;
    return r;
}
