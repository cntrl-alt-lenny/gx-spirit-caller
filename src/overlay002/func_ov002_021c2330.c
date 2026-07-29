/* func_ov002_021c2330: guard chain to a shared "return 1" tail; only
 * returns 0 when all three guards pass AND arg1<=4. */
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern int func_ov002_021b9ecc(int self, int arg1);

int func_ov002_021c2330(int self, int arg1) {
    int off = (self & 1) * 0x868;
    unsigned short h = *(unsigned short *)(data_ov002_022cf1a4 + off + arg1 * 20);
    if (h == 0) {
        goto fail;
    }
    if (func_ov002_021b9ecc(self, arg1) != 0x1a8d) {
        goto fail;
    }
    if ((*(unsigned int *)(data_ov002_022cf1ac + off + arg1 * 20) >> 6) & 1) {
        goto fail;
    }
    if (arg1 <= 4) {
        return 0;
    }
fail:
    return 1;
}
