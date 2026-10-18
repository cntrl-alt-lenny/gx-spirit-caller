typedef unsigned short u16;
typedef unsigned int u32;

struct St {
    u16 f0;
    u16 f2_0 : 1;
    u16 f2_rest : 15;
};

struct Pl {
    char pad[0xc];
    u32 count;
    char rest[0x868 - 0x10];
};

struct Q {
    u32 count;
    char rest[0x868 - 4];
};

extern struct Pl data_ov002_022cf16c[];
extern struct Q data_ov002_022cf178[];
extern int func_ov002_021ff3bc(struct St *a, int b);
extern int func_ov002_021ff320(struct St *a, int b);
extern int func_ov002_022536e8(u32 a, u32 b, u32 c);

int func_ov002_0220a008(struct St *st, int arg) {
    u32 i;
    if (func_ov002_021ff3bc(st, arg) == 0) {
        return 0;
    }
    if (func_ov002_021ff320(st, arg) == 0) {
        return 0;
    }
    i = 0;
    if (i < data_ov002_022cf178[st->f2_0 & 1].count) {
        do {
            if (func_ov002_022536e8(st->f2_0, st->f0, i) != 0) {
                return 1;
            }
            i++;
        } while (i < data_ov002_022cf16c[st->f2_0 & 1].count);
    }
    return 0;
}
