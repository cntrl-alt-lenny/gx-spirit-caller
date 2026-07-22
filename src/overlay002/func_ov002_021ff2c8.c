typedef struct {
    char pad0[2];
    unsigned short bit0 : 1;
    unsigned short pad1 : 15;
    unsigned short pad4_0_6 : 6;
    unsigned short field6_9 : 9;
    unsigned short pad4_15 : 1;
} S021ff2c8;

extern int func_ov002_021b9aa8(int, int);
extern char data_ov002_022cf178[];

int func_ov002_021ff2c8(S021ff2c8 *p, int arg1) {
    int result = func_ov002_021b9aa8(arg1, p->field6_9);
    int idx = p->bit0 & 1;
    int tableval = *(int *)(data_ov002_022cf178 + idx * 0x868);
    return tableval - (result >= 0);
}
