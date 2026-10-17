typedef struct {
    int field_0;
    int field_4;
    int field_8;
    int field_c;
} State;

extern State data_021a83e4;
extern int func_0209b4e4(void);
extern void func_0209adb4(int cmd);

int func_0209b16c(unsigned int cmd, int a1, int a2) {
    if (func_0209b4e4() == 0) {
        return 1;
    }
    data_021a83e4.field_4 = a1;
    data_021a83e4.field_8 = a2;
    func_0209adb4(((cmd >> 16) & 0xff) | 0x02006300);
    func_0209adb4((cmd & 0xffff) | 0x01010000);
    return 0;
}
