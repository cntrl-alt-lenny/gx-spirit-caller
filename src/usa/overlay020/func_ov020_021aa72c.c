extern char data_ov020_021adf80[];
extern unsigned short data_ov020_021ae894[];
extern char data_ov020_021adfc8[];

extern int func_ov020_021aa6cc(int a, int b, int c, int d);

int func_ov020_021aa72c(void) {
    char *p0 = data_ov020_021adf80;
    unsigned short *p1 = data_ov020_021ae894;
    char *p2 = data_ov020_021adfc8;

    if (p1[*(int *)(p0 + 0x910) - 1] == 4) {
        int i, b;
        for (i = 0, b = 0x1c; i < 4; i++, b += 0x28) {
            if (func_ov020_021aa6cc(8, b, 0xf0, 0x24) == 1) {
                return i;
            }
        }
        goto end;
    }

    if (*(unsigned short *)(p2 + 0x8cc
            + (*(int *)(p2 + 0x8c8) - 1) * 2) == 3) {
        int b, i;
        for (i = 0, b = 0x1c; i < 3; i++, b += 0x28) {
            if (func_ov020_021aa6cc(8, b, 0xf0, 0x24) == 1) {
                return i;
            }
        }
    }

end:
    return -1;
}
