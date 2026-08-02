typedef struct {
    char _pad0[4];
    unsigned short _pad_bits : 2;
    unsigned short flag : 1;
} S_t;

extern char data_ov002_022cf0c2[];

extern int func_ov002_0223de48(S_t *a, int b, int *out);
extern void func_ov002_021d6718(S_t *a, int b0, int b1, int b2, int b3);

int func_ov002_02216fa8(S_t *a) {
    int val;

    if (a->flag) {
        return 0;
    }

    if (func_ov002_0223de48(a, 0, &val)) {
        int byte0 = val & 0xff;
        int bit0 = byte0 & 1;
        int byte1 = ((int)(unsigned short)val >> 8) & 0xff;
        int row = bit0 * 0x868;
        unsigned short cell = *(unsigned short *)(data_ov002_022cf0c2 + row + byte1 * 20);
        if (cell == 0) {
            func_ov002_021d6718(a, byte0, byte1, 0, 0);
        }
    }
    return 0;
}
