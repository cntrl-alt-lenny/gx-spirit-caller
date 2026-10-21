typedef unsigned int u32;
struct State {
    char pad[0x2a0];
    int mode;
    u32 low : 4;
    u32 flag : 1;
    u32 rest : 27;
    u32 f2a8;
    u32 f2ac;
    u32 f2b0;
    u32 f2b4;
    u32 f2b8;
    u32 f2bc;
};
struct Other { char pad[0x260]; u32 flags; };
extern struct State data_ov011_021d4000;
extern struct Other data_ov011_021d403c;
extern void func_ov011_021cc3d4(void);
extern void func_ov011_021cd638(void);
extern void func_ov011_021ccf3c(void);
extern void func_ov011_021ca600(void);
void func_ov011_021cfa50(void) {
    struct Other *p = &data_ov011_021d403c;
    data_ov011_021d4000.f2b0 &= 0xffe01fff;
    func_ov011_021cc3d4();
    func_ov011_021cd638();
    data_ov011_021d4000.f2bc |= 0x200;
    data_ov011_021d4000.flag = 0;
    data_ov011_021d4000.low = 0;
    func_ov011_021ccf3c();
    data_ov011_021d4000.f2ac &= ~0x10000000;
    func_ov011_021ca600();
    switch (data_ov011_021d4000.mode) {
    case 0:
        *(unsigned short *)0x04000008 = (*(unsigned short *)0x04000008 & ~3) | 2;
        break;
    case 1:
        break;
    }
    p->flags &= ~0x100000;
}
