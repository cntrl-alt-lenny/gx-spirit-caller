extern struct { char _pad[0xd0]; unsigned int f_d0; } data_ov002_022d016c;
extern int func_ov002_02217888(void *a, void *b);
extern int func_ov002_022205f8(void *a, void *b);

struct S {
    char _pad[4];
    unsigned short f_4_0 : 2;
    unsigned short f_4_2 : 1;
    unsigned short f_4_3 : 13;
    char _pad2[4];
    unsigned short f_a;
};

int func_ov002_0221d218(struct S *a, void *b) {
    unsigned int v;
    if (a->f_4_2) {
        return 0;
    }
    switch (a->f_a) {
    case 1:
        return func_ov002_02217888(a, b);
    case 2:
        v = data_ov002_022d016c.f_d0;
        if (v & 1) {
            return 0;
        }
        if (((v >> 1) & 1) == 0) {
            return 0;
        }
        return func_ov002_022205f8(a, b);
    default:
        return 0;
    }
}
