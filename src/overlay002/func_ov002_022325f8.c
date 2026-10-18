typedef unsigned int u32;
typedef signed int s32;
typedef struct {
    unsigned short w0;
    unsigned short bit0 : 1;
    unsigned short kind : 5;
    unsigned short pad1 : 8;
    unsigned short bit14 : 1;
    unsigned short pad15 : 1;
    unsigned short pad4 : 6;
    unsigned short id : 9;
    unsigned short pad5 : 1;
} S021ff3bc;
extern int func_ov002_021ff3bc(S021ff3bc *p, int unused1);
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern int func_ov002_021b99b4(int player, int id);
extern s32 func_ov002_021b9aa8(u32 a, u32 b);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
extern char data_ov002_022cf16c[];
int func_ov002_022325f8(S021ff3bc *p, int unused1) {
    int index;
    if (func_ov002_021ff3bc(p, unused1) == 0) return 0;
    if (func_ov002_021ca3f0(p->bit0, p->w0) == 0) return 0;
    if (p->kind == 14) {
        index = func_ov002_021b99b4(p->bit0, p->id);
        if (index >= 0) {
            func_ov002_0227adb8(p->bit0, (int)(data_ov002_022cf16c + (p->bit0 & 1) * 0x868 + 0x418 + index * 4), 1, p->w0 << 16);
        }
    } else {
        index = func_ov002_021b9aa8(p->bit0, p->id);
        if (index >= 0) {
            func_ov002_0227adb8(p->bit0, (int)(data_ov002_022cf16c + (p->bit0 & 1) * 0x868 + 0x120 + index * 4), 1, p->w0 << 16);
        }
    }
    return 0;
}
