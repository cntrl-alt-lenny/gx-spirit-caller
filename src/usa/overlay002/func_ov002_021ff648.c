typedef unsigned short u16;

extern int func_ov002_021bb83c(int a);
extern int func_ov002_021ff2cc(void *self, int arg1);
extern int func_ov002_02253600(int a, u16 b, int c);
extern int data_ov002_022cf09c[];

int func_ov002_021ff648(void *self, int arg1) {
    u16 field2 = *(u16 *)((char *)self + 2);
    int sub = (unsigned)(field2 << 20) >> 26;
    if (sub != 0x23) {
        if (func_ov002_021bb83c(0xfe4) == 0) {
            return 0;
        }
    }
    if (func_ov002_021ff2cc(self, arg1) == 0) {
        return 0;
    }
    u16 field2b = *(u16 *)((char *)self + 2);
    int bit0 = (unsigned)(field2b << 31) >> 31;
    if (*(int *)((char *)data_ov002_022cf09c + (bit0 & 1) * 0x868) == 0) {
        if (func_ov002_02253600(bit0, *(u16 *)self, 0) == 0) {
            return 0;
        }
    }
    return 1;
}
