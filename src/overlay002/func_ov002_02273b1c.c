typedef unsigned int u32;
typedef unsigned short u16;
struct S02273b1c {
    u32 w0;
    char _pad[0x16 - 4];
    u16 b0 : 1;
    u16 b1 : 1;
    u16 rest : 14;
};
extern struct S02273b1c data_ov002_022cd300;
extern int func_ov002_02271ab4(void);

int func_ov002_02273b1c(void) {
    if (data_ov002_022cd300.b1) {
        data_ov002_022cd300.w0 &= ~0xc0;
        return 1;
    }
    return func_ov002_02271ab4();
}
