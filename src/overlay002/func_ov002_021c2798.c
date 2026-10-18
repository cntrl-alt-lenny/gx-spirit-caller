struct ce288 {
    char _a[1156];
    int f1156;
};
struct ent {
    unsigned short f0;
    unsigned short f2_0 : 1;
    unsigned short f2_1 : 5;
    unsigned short f2_rest : 10;
    unsigned short f4;
    unsigned short f6_0 : 8;
    unsigned short f6_1 : 8;
    char _pad[16];
};

extern struct ce288 data_ov002_022ce288;
extern struct ent data_ov002_022ce588[];
extern int func_ov002_0223de94(struct ent *e, int i);

int func_ov002_021c2798(int a, int b, unsigned int c, unsigned int d) {
    int i;
    int j;
    struct ent *e;
    unsigned short key;

    i = data_ov002_022ce288.f1156 - 1;
    if (i >= 0) {
        e = &data_ov002_022ce588[i];
        key = (unsigned char)a | ((unsigned char)b << 8);
        do {
            if (e->f2_0 == c && e->f2_1 == d) {
                for (j = 0; j < e->f6_0; j++) {
                    if (key == func_ov002_0223de94(e, j)) {
                        return 1;
                    }
                }
            }
            e--;
        } while (--i >= 0);
    }
    return 0;
}
