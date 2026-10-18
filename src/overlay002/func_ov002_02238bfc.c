struct S { unsigned short f0; unsigned short b : 1; };
extern int data_ov002_022ce288[];
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern unsigned short data_ov002_022d0e6c[];
extern void func_ov002_021e2550(int self, int a, int b, int c);
extern void func_ov002_0226af78(int a, int b);

int func_ov002_02238bfc(struct S *p) {
    int idx;
    switch (data_ov002_022ce288[0x5a8 / 4]) {
    case 0x80:
        idx = 1 - p->b;
        if (*(int *)(data_ov002_022cf178 + (idx & 1) * 0x868) == 0) return 0;
        func_ov002_0226af78(idx, 0);
        return 0x7f;
    case 0x7f:
        idx = 1 - p->b;
        func_ov002_021e2550(idx, data_ov002_022d0e6c[0xb0 / 2],
                            (int)(data_ov002_022cf16c + (idx & 1) * 0x868 + 0x120 + data_ov002_022d0e6c[0xb0 / 2] * 4), 1);
        return 0;
    }
    return 0;
}
