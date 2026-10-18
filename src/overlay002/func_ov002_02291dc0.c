struct F_F2 {
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};

struct F_Self {
    unsigned short f0;
    struct F_F2 f2;
};

struct Row {
    char pad[0x30];
    unsigned int w0 : 13;
    unsigned int w0r : 19;
    unsigned short h4;
    unsigned short h6;
};

extern char data_ov002_022cf16c[];
extern int func_ov002_021b3ecc(int a, int b, int c);
extern int func_ov002_02280b74(int a, int b, int c, int d, int e);
extern int func_ov002_021c8470(int a, int b);

int func_ov002_02291dc0(struct F_Self *self) {
    int i;
    int limit;
    if (func_ov002_021b3ecc(1 - self->f2.bit0, 11, 0x12ce) == 0) {
        limit = func_ov002_02280b74(self->f2.bit0, self->f2.bit0, -1, 1, 0);
        for (i = 0; i < 5; i++) {
            int p = 1 - self->f2.bit0;
            struct Row *s = (struct Row *)(data_ov002_022cf16c + (p & 1) * 0x868 + i * 20);
            if (s->w0 != 0 && s->h6 == 0) {
                if (func_ov002_021c8470(p, i) < limit) {
                    return 1;
                }
            }
        }
    }
    return 0;
}
