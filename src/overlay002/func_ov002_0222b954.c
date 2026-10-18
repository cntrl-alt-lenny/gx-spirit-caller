extern char data_ov002_022cf1a2[];
extern int func_ov002_021b3ecc(int a, int b, int f0);
extern void func_ov002_021de910(void *self, int a, int b);
extern void func_ov002_021de9d4(void *self, int a, int b);
extern void func_ov002_021d6808(void *self, int a, int b, int c, int d);

int func_ov002_0222b954(void *self) {
    int t = *(int *)((char *)self + 0x14);
    int lo = (unsigned char)t;
    int hi = (unsigned char)(((int)(unsigned short)t) >> 8);
    int f0 = *(unsigned short *)self;
    if (func_ov002_021b3ecc(lo, hi, f0) != 0) {
        switch (*(unsigned short *)self) {
        case 0x1700:
            func_ov002_021de910(self, lo, hi);
            break;
        case 0x1749:
            func_ov002_021de9d4(self, lo, hi);
            break;
        case 0x1703:
            if (*(unsigned short *)(data_ov002_022cf1a2 + (lo & 1) * 0x868 + hi * 0x14) == 0)
                func_ov002_021d6808(self, lo, hi, 0, 1);
            break;
        }
    }
    return 0;
}
