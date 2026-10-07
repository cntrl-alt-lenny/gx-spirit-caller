typedef struct {
    int w0;
    char pad4[4];
    int w8;
    char padc[4];
    int w10;
    char pad14[0x10];
    int w24;
    char pad28[0x3c];
    int w64;
} State;

extern State data_0219ad48;

int func_0202d9a0(void) {
    if (data_0219ad48.w0 == 0) {
        return 0;
    }
    data_0219ad48.w64++;
    if (data_0219ad48.w24 != 0) {
        data_0219ad48.w10++;
        if (data_0219ad48.w10 >= data_0219ad48.w8 + 0x60) {
            data_0219ad48.w10 = 0;
        }
    }
    return 1;
}
