typedef struct {
    int w0;
    char pad4[0x10];
    int w14;
    int w18;
    char pad1c[8];
    int w24;
} State;

extern State data_0219ad48;
extern void func_0202d194(int a);
extern void func_02037208(int a, int b, int c, int d);

void func_0202ce24(void) {
    if (data_0219ad48.w0 != 0 && data_0219ad48.w24 != 0 && data_0219ad48.w18 != 0) {
        if (data_0219ad48.w14 == 0) {
            func_0202d194(1);
            func_02037208(0x35, -1, 0, 1);
        }
    }
}
