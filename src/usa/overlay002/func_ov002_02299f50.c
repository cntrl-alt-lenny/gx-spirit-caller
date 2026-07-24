/* func_ov002_02299f50: count = bits 20:24 of data_02104e6c+0xa64; if count>0
 * and the (count-1)th u16 in data_ov002_022ca260 equals val, return TRUE. */

extern struct {
    char pad[0xa64];
    unsigned int f_a64;
} data_02104e6c;

extern unsigned short data_ov002_022ca260[];

int func_ov002_02299f50(unsigned short val) {
    int count = (data_02104e6c.f_a64 & 0x1f00000) >> 20;
    if (count > 0 && data_ov002_022ca260[count - 1] == val) {
        return 1;
    }
    return 0;
}
