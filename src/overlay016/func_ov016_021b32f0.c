extern int func_02037208(int, int, int, int);
extern void *func_0202c0c0(int);
extern int func_ov016_021b35dc(void *);
extern int func_ov016_021b3b14(void *);
extern int func_ov016_021b61dc(void *);
extern int func_ov016_021b5544(void *, int, void *);
extern char data_ov016_021b9740[];
extern char data_ov016_021babec[];
extern char data_ov016_021bac64[];
extern char data_ov016_021bac38[];
#define REG_A (*(volatile unsigned int *)0x04000000)
#define REG_B (*(volatile unsigned int *)0x04001000)
int func_ov016_021b32f0(void *arg, int state) {
    unsigned int field;
    int *p = arg;
    switch (state) {
    case 0:
        func_02037208(0x42, -1, 0, 1);
        return 1;
    case 1:
        p[1] = 1;
        func_02037208(0x3a, -1, 0, 1);
        field = (REG_B & 0x1f00) >> 8;
        REG_B = (REG_B & ~0x1f00) | ((field & ~0x10) << 8);
        func_ov016_021b35dc(arg);
        field = (REG_B & 0x1f00) >> 8;
        REG_B = (REG_B & ~0x1f00) | ((field & ~4) << 8);
        func_ov016_021b3b14(data_ov016_021babec);
        break;
    case 2:
        if (*(int *)(data_ov016_021b9740 + 0x8c) != 0) {
            field = (REG_A & 0x1f00) >> 8;
            REG_A = (REG_A & ~0x1f00) | ((field & ~6) << 8);
            p[1] = 2;
            field = (REG_B & 0x1f00) >> 8;
            REG_B = (REG_B & ~0x1f00) | ((field & ~0x10) << 8);
            func_ov016_021b35dc(arg);
            field = (REG_B & 0x1f00) >> 8;
            REG_B = (REG_B & ~0x1f00) | ((field & ~4) << 8);
            func_ov016_021b61dc(data_ov016_021bac64);
            func_02037208(0x3a, -1, 0, 1);
        } else {
            func_ov016_021b5544(data_ov016_021bac38, 1, func_0202c0c0(0x6b5));
            func_02037208(0x43, -1, 0, 1);
        }
        break;
    }
    return 0;
}
