typedef unsigned short u16;
extern int func_ov002_0226ac08(int a, int b, u16 c, u16 d);

void func_ov002_0226acb4(int arg0, int arg1, int arg2, int arg3) {
    u16 flags = 0;
    if (arg1 == 0) return;
    if (arg2 == 1) flags |= 1;
    if (arg3 != 0) flags |= 2;
    if (arg2 == 8) flags |= 4;
    if (arg2 == 7) flags |= 8;
    func_ov002_0226ac08(arg0, 1, (u16)arg1, flags);
}
