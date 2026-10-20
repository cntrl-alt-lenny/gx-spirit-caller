typedef struct {
    char pad0[2];
    unsigned short bit0 : 1;
    unsigned short pad1 : 15;
    unsigned short pad4_0_6 : 6;
    unsigned short field6_9 : 9;
    unsigned short pad4_15 : 1;
} S021ff2c8;
extern int func_ov002_021ff2c8(S021ff2c8 *p, int arg1);
extern char data_ov002_022cf178[];
extern char data_ov002_022cf17c[];
int func_ov002_022044e0(S021ff2c8 *p) {
    unsigned int bit = p->bit0;
    if (*(int *)(data_ov002_022cf17c + (bit & 1) * 0x868) == 0) return 0;
    if (*(int *)(data_ov002_022cf178 + ((1 - bit) & 1) * 0x868) != 0) {
        if (func_ov002_021ff2c8(p, bit) > 0) return 1;
    }
    return 0;
}
