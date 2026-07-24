/* func_ov002_0229a060: count = bits 20:24 of data_02104f4c+0xa64; if count>0
 * and the (count-1)th u16 in data_ov002_022ca370 equals val, return TRUE. */

extern struct {
    char pad[0xa64];
    unsigned int f_a64;
} data_02104f4c;

extern unsigned short data_ov002_022ca370[];

int func_ov002_0229a060(unsigned short val) {
    int count = (data_02104f4c.f_a64 & 0x1f00000) >> 20;
    if (count > 0 && data_ov002_022ca370[count - 1] == val) {
        return 1;
    }
    return 0;
}
