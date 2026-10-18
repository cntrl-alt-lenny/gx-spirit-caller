struct G288 {
    char pad0[0x5cc];
    int f5cc;
    int f5d0;
    char pad1[4];
    int f5d8;
};
struct G16c {
    char pad0[0xcec];
    int fcec;
    char pad1[0x1c];
    int fd0c;
};

extern struct G288 data_ov002_022ce288;
extern struct G16c data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern void func_ov002_021b1570();

void func_ov002_021e2bd4(void) {
    short s;
    int n;
    if (data_ov002_022ce288.f5d8 != 0)
        return;
    if (data_ov002_022d016c.fd0c == 0 || data_ov002_022cd744[data_ov002_022d016c.fcec] != 2) {
        n = data_ov002_022ce288.f5cc;
        data_ov002_022ce288.f5cc = n + 1;
        if (n == 0)
            data_ov002_022ce288.f5d0 = data_ov002_022ce288.f5d0 + 1;
    } else {
        s = 2;
        func_ov002_021b1570(10, -1, &s);
    }
}
