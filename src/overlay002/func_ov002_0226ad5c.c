typedef unsigned short u16;
typedef signed int s32;

extern void func_ov002_0226acf8(s32 a, s32 b, u16 c, u16 d);

void func_ov002_0226ad5c(s32 arg0, s32 arg1, s32 arg2, s32 arg3) {
    u16 flags = 0;

    if (arg1 == 0)
        return;

    if (arg2 != 0)
        flags |= 0x1;
    if (arg3 != 0)
        flags |= 0x2;

    func_ov002_0226acf8(arg0, 1, (u16)arg1, flags);
}
