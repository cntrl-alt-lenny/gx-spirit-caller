typedef struct {
    unsigned short pad[2];
    unsigned short value : 8;
    unsigned short upper : 8;
} State;
extern State data_ov008_021b2dc0;
extern unsigned short data_ov008_021b2c80[];
extern int func_020b3870(int a, int b);
extern int func_02037208(int a0, int r1, int r2, int r3);
void func_ov008_021acdd0(int x) {
    int count = data_ov008_021b2c80[45];
    int step;
    int old;
    int i;
    int pos;
    if ((unsigned int)count > 6) count = 6;
    step = func_020b3870(240, count * 2);
    old = data_ov008_021b2dc0.upper;
    pos = step;
    for (i = 0; i < count; i++) {
        if (x < pos + 24) break;
        pos += step * 2;
    }
    if (i == count) data_ov008_021b2dc0.upper = (unsigned short)(count - 1);
    else data_ov008_021b2dc0.upper = (unsigned short)i;
    if (old != data_ov008_021b2dc0.upper) func_02037208(56, -1, 0, 1);
}

