extern char data_ov002_022cf1a4[];
extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021b3618(int a, int b);
extern void func_ov002_021d5ab4(int a, int b, int c, int d);

void func_ov002_021d6dbc(int arg0, int arg1) {
    int a = arg0 & 0xff;
    int b = (arg0 >> 8) & 0xff;
    int c = arg1 & 0xff;
    int r;
    if (a == c)
        return;
    if (*(unsigned short *)(data_ov002_022cf1a4 + (a & 1) * 0x868 + b * 20) == 0)
        return;
    if (func_ov002_021b9ecc(a, b) != 0x14ac)
        return;
    r = func_ov002_021b3618(a, b);
    if (r == 0xffff)
        return;
    func_ov002_021d5ab4(r & 0xff, ((unsigned short)r >> 8) & 0xff,
                        (unsigned short)((unsigned char)a | ((unsigned char)b << 8)), 1);
}
