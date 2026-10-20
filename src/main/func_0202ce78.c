typedef struct {
    char pad[0x24];
    unsigned int f24;
} Arg_02005240;
extern void func_02005088(int a0, int a1, int a2, int a3, int a4, int a5);
extern void func_02005240(Arg_02005240 *a0, int a1, int a2, int a3, int a4, int a5);
extern void func_02001c98(unsigned int a, unsigned int b);
extern Arg_02005240 data_02102c90;

void func_0202ce78(signed char *p, int a, int x, int y, int spacing) {
    while (*p) {
        if (*p == '$' && p[1] == 'R') {
            int m = 0;
            int n = 0;
            signed char *base;
            signed char *ruby;
            int rw;
            int width;
            int bw;
            p += 2;
            base = p;
            while (*p != '(') { p += 2; ++n; }
            *p++ = 0;
            ruby = p;
            while (*p != ')') { p += 2; ++m; }
            *p++ = 0;
            bw = spacing * n;
            width = bw < m * 8 ? m * 8 : bw;
            rw = m * 8;
            func_02005088((int)&data_02102c90, (int)base, a, x + (width - bw) / 2, y + 8, spacing);
            func_02001c98(15, 0);
            func_02005240(&data_02102c90, (int)ruby, a, x + (width - rw) / 2, y, 8);
            x += width;
        } else {
            signed char *base = p;
            int ch;
            while ((ch = *p) != 0 && ch != '$') {
                p += (ch < 0 ? 1 : 0) + 1;
            }
            *p = 0;
            func_02005088((int)&data_02102c90, (int)base, a, x, y + 8, spacing);
            x = ((int *)&data_02102c90)[2];
            *p = ch;
        }
    }
}




