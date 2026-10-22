typedef unsigned short u16;
typedef struct { u16 f0, f2, f4, f6; char pad[0x804]; int f80c, f810; } Ctx;
typedef struct { int value; char pad[0x864]; } Entry;
typedef struct { char pad[0xcec]; int fcec; char pad2[8]; int fcf8; } State;
extern Ctx data_ov002_022ce950;
extern Entry data_ov002_022cf180[], data_ov002_022cf188[], data_ov002_022cf288[];
extern State data_ov002_022d016c;
extern int func_ov002_021b947c(int val);
extern void func_ov002_021c2c54(int player, u16 val);
extern void func_ov002_021c2d34(int player, u16 val);
extern int func_ov002_021c9504(int player, int kind, int extra);
extern int func_ov002_0229ade0(int a, int b, int c, int d);
extern int func_ov002_0229c7f8(int a);
void func_ov002_021cf85c(void) {
    int flag = (data_ov002_022ce950.f0 & 0x8000) != 0;
    int kind, id, val;
    val = data_ov002_022ce950.f6;
    kind = data_ov002_022ce950.f2;
    id = data_ov002_022ce950.f4;
    int result = func_ov002_021b947c(val);
    int index = -1;
    if ((result & 0xff) == flag && (((int)(u16)result >> 8) & 0xff) == kind)
        index = (u16)((unsigned int)result >> 16);
    switch (data_ov002_022ce950.f810) {
    case 0:
        if (kind == 14 && index >= 0 && index != data_ov002_022cf180[flag & 1].value - 1) {
            func_ov002_021c2c54(flag, (u16)val);
            func_ov002_0229ade0(0x16, flag, kind, val);
        }
        if (kind == 15 && index >= 0 && index != data_ov002_022cf188[flag & 1].value - 1) {
            func_ov002_021c2d34(flag, (u16)val);
            func_ov002_0229ade0(0x16, flag, kind, val);
        }
        data_ov002_022ce950.f810++;
        break;
    case 1:
        if (func_ov002_0229c7f8(0x16) != 0) return;
        func_ov002_0229ade0(0x43, flag, id, 0);
        data_ov002_022ce950.f810++;
        break;
    case 2:
        if (func_ov002_0229c7f8(0x43) != 0) return;
        if (index < 0 || (kind <= 10 && func_ov002_021c9504(flag, kind, index) == 0)) {
            u16 packed = flag & 1;
            packed |= 0x20;
            func_ov002_0229ade0(0x20, packed, id, val);
        }
        else
            func_ov002_0229ade0(0x20, (u16)((flag & 1) | ((kind & 31) << 1) | ((index & 255) << 6)), id, val);
        data_ov002_022ce950.f810++;
        break;
    case 3:
        if (func_ov002_0229c7f8(0x20) != 0) return;
        if (data_ov002_022d016c.fcf8 == 2)
            data_ov002_022cf288[data_ov002_022d016c.fcec & 1].value |= 0x100000;
        data_ov002_022ce950.f80c = 0;
        break;
    }
}


