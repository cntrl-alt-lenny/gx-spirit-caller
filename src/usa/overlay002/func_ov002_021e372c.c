typedef unsigned short u16;

extern int func_0202e1e0(int id);
extern unsigned int func_0202b86c(int id);

struct F2Cat {
    u16 _lo : 12;
    u16 cat : 2;
};

struct F4Flag3 {
    u16 _lo : 3;
    u16 flag : 1;
};

struct F4Flag2 {
    u16 _lo : 2;
    u16 flag : 1;
};

int func_ov002_021e372c(u16 *p) {
    struct F2Cat *f2cat = (struct F2Cat *)(p + 1);
    struct F4Flag3 *f4flag3 = (struct F4Flag3 *)(p + 2);
    struct F4Flag2 *f4flag2 = (struct F4Flag2 *)(p + 2);
    int r;

    if (f2cat->cat != 0) {
        return 0;
    }
    if (f4flag3->flag != 0) {
        return 1;
    }
    if (func_0202e1e0(p[0]) != 0) {
        return 0;
    }

    r = func_0202b86c(p[0]);
    switch (r) {
        case 2:
        case 3:
        case 4:
            return 0;
        default:
            break;
    }

    switch (p[0]) {
        case 0xfee:
        case 0x1102:
        case 0x1400:
        case 0x1aa3:
            return 0;
        case 0x1231:
        case 0x1238:
        case 0x1514:
        case 0x159c:
        case 0x1980:
        case 0x1a18:
        case 0x1a69:
            return f4flag2->flag;
        default:
            return 1;
    }
}
