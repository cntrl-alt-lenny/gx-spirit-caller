typedef struct {
    char _pad0[0x28];
    char s28[0x1f];
    char s47[0x15];
    char s5c[0x33];
    char s8f[0x1f];
    char sae[0x1f];
    char _padcd[0x130 - 0xcd];
    int x130;
    int x134;
} Entry;

extern int func_0205ffc0(void *p, int b);
extern int func_0205fac4(void *pp, Entry **out, int id);
extern int func_0205fa30(void *pp, Entry *e, int a, int b, int c);
extern void func_020604b0(char *dst, char *src, int n);
extern char *func_02055298(char *str);
extern char data_021010d4[];

int func_0205f844(void *pp, char *a, char *b, char *c, char *d, char *e, int f, int g, int h, int i, int j) {
    Entry *ent;
    int r;

    if ((a == 0 || *a == 0) && (c == 0 || *c == 0) && (d == 0 || *d == 0) &&
        (e == 0 || *e == 0) && f == 0 && (b == 0 || *b == 0)) {
        func_0205ffc0(pp, (int)data_021010d4);
        return 2;
    }
    r = func_0205fac4(pp, &ent, 1);
    if (r != 0) {
        return r;
    }
    if (a == 0) {
        ent->s28[0] = 0;
    } else {
        func_020604b0(ent->s28, a, 0x1f);
    }
    if (b == 0) {
        ent->s47[0] = 0;
    } else {
        func_020604b0(ent->s47, b, 0x15);
    }
    if (c == 0) {
        ent->s5c[0] = 0;
    } else {
        func_020604b0(ent->s5c, c, 0x33);
    }
    func_02055298(ent->s5c);
    if (d == 0) {
        ent->s8f[0] = 0;
    } else {
        func_020604b0(ent->s8f, d, 0x1f);
    }
    if (e == 0) {
        ent->sae[0] = 0;
    } else {
        func_020604b0(ent->sae, e, 0x1f);
    }
    ent->x130 = f;
    if (g < 0) {
        g = 0;
    }
    ent->x134 = g;
    r = func_0205fa30(pp, ent, h, i, j);
    if (r != 0) {
        return r;
    }
    return 0;
}
