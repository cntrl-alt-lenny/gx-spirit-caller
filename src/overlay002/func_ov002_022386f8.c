typedef unsigned int u32;
typedef unsigned short u16;

typedef struct Obj {
    u16 w0;
    u16 bit0 : 1;
    u16 rest : 15;
    u16 w4;
    u16 w6;
    u16 w8;
} Obj;

extern char data_ov002_022cf16c[];
extern int func_ov002_021ff3bc();
extern int func_ov002_021b9aa8(u32 bit, u32 w);
extern int func_ov002_0227adb8(u32 bit, void *p, int one, u32 w);

int func_ov002_022386f8(Obj *obj)
{
    if (func_ov002_021ff3bc(obj) != 0) {
        int n = func_ov002_021b9aa8(obj->bit0, obj->w8);
        if (n >= 0) {
            func_ov002_0227adb8(obj->bit0, data_ov002_022cf16c + (obj->bit0 & 1) * 0x868 + 0x120 + n * 4, 1, obj->w0 << 16);
        }
    }
    return 0;
}
