extern int func_02037208(int a0, int r1, int r2, int r3);
extern void *func_0202c0c0(int id);
extern void func_ov016_021b5544(void *a, int b, void *c);
extern struct StateA { char pad[152]; unsigned short flags; } data_ov016_021bab44;
extern char data_ov016_021bac38[];
extern struct StateB { char pad[476]; int position, x, unused, y, unused2, active; } data_ov016_021bb2c4;
extern struct StateC { char pad[216]; unsigned short active; } data_ov016_021bb3c4;
int func_ov016_021b6f08(int *p, int state) {
    unsigned int field;
    switch (state) {
    case 0:
        field = (*(volatile unsigned int *)0x04001000 & 0x1f00) >> 8;
        *(volatile unsigned int *)0x04001000 = (*(volatile unsigned int *)0x04001000 & ~0x1f00) | ((field & ~0x10) << 8);
        func_02037208(0x42, -1, 0, 1);
        p[0] = 2;
        data_ov016_021bb2c4.active = 1;
        break;
    case 1:
        data_ov016_021bab44.flags |= 2;
        func_ov016_021b5544(data_ov016_021bac38, 0x12, func_0202c0c0(0x6b4));
        func_02037208(0x43, -1, 0, 1);
        break;
    case 2:
        data_ov016_021bb2c4.position = p[3] + p[4];
        data_ov016_021bb3c4.active = 1;
        data_ov016_021bb2c4.x = -128;
        data_ov016_021bb2c4.y = -184;
        break;
    }
    return 0;
}



