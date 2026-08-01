typedef unsigned short u16;

extern void func_020110c4(void *p);
extern void func_02010eb8(void);

struct Record0f84 {
    char _pad0[0x60];
    int f60, f64, f68, f6c, f70, f74, f78, f7c, f80;
    int f84, f88, f8c;
    int f90;
    u16 f94, f96, f98, f9a;
    int f9c;
    int fa0;
    char _pad1[4];
    int fa8;
    int fac;
    int fb0;
    int fb4;
};

extern struct Record0f84 data_0218fd10[];

void *func_02010f84(int mode, int idx) {
    struct Record0f84 *rec;

    if (idx < 0 || idx >= 2) {
        return 0;
    }

    rec = &data_0218fd10[idx];
    rec->fa8 = 1;
    func_020110c4(rec);
    func_020110c4((char *)rec + 0x30);

    rec->f60 = 0;
    rec->f64 = 0;
    rec->f68 = 0xa000;
    rec->f6c = 0;
    rec->f70 = 0;
    rec->f74 = 0;
    rec->f78 = 0;
    rec->f7c = 0x1000;
    rec->f80 = 0;
    rec->f90 = 0;

    switch (mode) {
    case 0:
        rec->f9c = 0x7500;
        rec->f94 = 0;
        rec->f96 = 0;
        rec->f98 = 0;
        rec->f9a = 0x8000;
        rec->f84 = 0;
        rec->f88 = 0;
        rec->f8c = 0;
        rec->f60 = 0;
        rec->f64 = 0;
        rec->f68 = 0x8fb2;
        rec->f6c = 0;
        rec->f70 = 0;
        rec->f74 = 0;
        rec->fa0 = 0x41c80000;
        rec->fb4 = 0;
        rec->fac = 0;
        rec->fb0 = 0;
        break;
    case 1:
        rec->fb4 = 1;
        rec->fac = 0;
        rec->fb0 = (int)func_02010eb8;
        break;
    default:
        break;
    }

    return rec;
}
