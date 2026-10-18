typedef unsigned char u8;
typedef unsigned short u16;

extern char data_ov002_022d016c[];
extern char data_ov002_022d0e6c[];
extern char data_ov002_022d0f1c[];
extern int func_ov002_021bc8c8(int a, int b, int c);
extern int func_ov002_021c8940();

int func_ov002_0226c2b8(int a, int b, int c) {
    int e = b + c;
    int t;
    if (e <= 4 && func_ov002_021bc8c8(*(int *)(data_ov002_022d016c + 0xd94), a, e) != 0) {
        if (*(u16 *)(data_ov002_022d0e6c + 0xa0) != (u16)((u8)a | ((u8)e << 8))) {
            t = ((int)*(u16 *)(data_ov002_022d0e6c + 0xa2) >> 8) & 0xff;
            if (t != 0 && t != func_ov002_021c8940(a, e)) return 0;
            return (*(u16 *)(data_ov002_022d0f1c + (a + 1) * 2) & (1 << e)) ? 0 : 0x800;
        }
    }
    return 0;
}
