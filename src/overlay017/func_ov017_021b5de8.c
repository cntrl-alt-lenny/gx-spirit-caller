typedef struct {
    int unused;
    unsigned int mode;
    int unused2;
    int a;
    int b;
    int unused3[2];
    int saved;
    unsigned char choices[1];
} Menu;
typedef struct { unsigned short value; unsigned short pad[3]; } Entry;
typedef struct { char pad[0x38]; void *seed; } Seed;
extern Entry data_021059ce[];
extern Entry data_021059c6[];
extern Seed data_021040ac;
extern int func_ov017_021b646c(Menu *p);
extern int func_ov017_021b6610(int *arg);
extern int func_02037208(int a0, int r1, int r2, int r3);
extern void func_020a9950(void *p);
extern int func_020a991c(void);
int func_ov017_021b5de8(Menu *p) {
    unsigned char *row;
    int index;
    int value;
    int *state = (int *)p;
    switch (state[0x1a]) {
    case 0:
        func_ov017_021b646c(p);
        if (p->mode == 2) {
            row = (unsigned char *)p + p->a;
            index = p->b;
            value = (row + index)[0x20];
            if (state[0x18] != value && state[0x18] > 0) {
                if (data_021059ce[value - 1].value == 0) {
                    func_020a9950(data_021040ac.seed);
                    data_021059c6[state[0x18]].value = func_020a991c() % 8 + 14;
                } else {
                    func_02037208(0x43, -1, 0, 1);
                    return 0;
                }
            }
        }
        state[0] = 2;
        state[2] = 0;
        func_02037208(0x3a, -1, 0, 1);
        break;
    case 1:
        row = (unsigned char *)p + p->a;
        index = p->b;
        value = (row + index)[0x20];
        if (state[0x18] != value)
            func_ov017_021b6610(state);
        state[0] = 2;
        state[2] = 0;
        func_02037208(0x42, -1, 0, 1);
        break;
    }
    return 1;
}
