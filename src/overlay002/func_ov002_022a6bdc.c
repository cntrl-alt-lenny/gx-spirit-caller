typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 pad0 : 14;
    u16 flag : 1;
    u16 pad1 : 1;
} Bits;

int func_ov002_022a6bdc(char *self) {
    int flags;
    int v;
    if (((Bits *)(self + 0x590))->flag != 0) {
        flags = *(int *)(self + 0x578);
        if ((flags & 4) == 0) {
            if (flags != 0) {
                return 0;
            }
            v = (*(u32 *)(self + 0x580) & 0x1f) - 8;
            if (v < 0) {
                v = -v;
            }
            v <<= 5;
            if (v >= 0x100) {
                v = 0x100;
            }
            return 0x100 - v;
        }
    }
    return -1;
}
