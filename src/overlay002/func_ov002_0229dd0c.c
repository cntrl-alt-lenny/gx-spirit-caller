struct State { char pad[0xa0]; int side, count, base, repeat; char pad2[8]; int direction; };
struct Point { int x, y; };
struct Flags { unsigned int pad; unsigned int low:3; unsigned int offset:2; unsigned int rest:27; };
extern int data_ov002_022cd73c[];
extern int data_ov002_022ca390[];
extern int data_ov002_022ca3a0[];
extern struct Flags data_02104f4c;
extern void func_ov002_0229dbc8(struct Point *out, struct State *s, int index);
extern unsigned int func_02006164(void);
extern unsigned int func_02006194(void);
static inline int canLeft(struct State *s) { if (s->base > 0) return 1; else return 0; }
static inline int canRight(struct State *s) { if (s->base < s->count - 8) return 1; else return 0; }
int func_ov002_0229dd0c(struct State *s, int x, int y) {
    struct Point p2, p;
    int base, d, n;
    if (data_02104f4c.offset & 2) y += 16;
    d = y - (data_ov002_022ca390[s->side == (data_ov002_022cd73c[1] ^ 1)] - 13);
    if (d >= 0 && d < 26) {
        base = s->base;
        func_ov002_0229dbc8(&p, s, base);
        p2 = p;
        if (s->side == (data_ov002_022cd73c[1] ^ 1)) {
            int d, n;
            d = -(x - (p2.x + 11));
            n = d / 22;
            if (d >= 0 && n < (s->count > 8 ? 8 : s->count)) {
                if (d % 22 < 2) return -1;
                return n + base;
            }
        } else {
            int d, n;
            d = x - (p2.x - 11);
            n = d / 22;
            if (d >= 0 && n < (s->count > 8 ? 8 : s->count)) {
                if (d % 22 < 2) return -1;
                return n + base;
            }
        }
        if (data_02104f4c.offset & 1) x += 24;
        if ((unsigned int)canLeft(s) > 0) {
            d = data_ov002_022ca3a0[s->side == (data_ov002_022cd73c[1] ^ 1)];
            if (x >= d - 12 && x < d + 12) {
                s->direction = -1;
                if (func_02006164()) return s->base - 1;
                if (func_02006194()) {
                    n = s->repeat - 1;
                    if (n >= -1) n = -1;
                    s->repeat = n;
                    if (n < -16) {
                        s->repeat = 0;
                        return s->base - 1;
                    }
                }
            }
        }
        if ((unsigned int)canRight(s) > 0) {
            d = data_ov002_022ca3a0[(s->side == (data_ov002_022cd73c[1] ^ 1)) ^ 1];
            if (x >= d - 12 && x < d + 12) {
                s->direction = 1;
                if (func_02006164()) return s->base + 8;
                if (func_02006194()) {
                    n = s->repeat + 1;
                    if (n < 1) n = 1;
                    s->repeat = n;
                    if (n > 16) {
                        s->repeat = 0;
                        return s->base + 8;
                    }
                }
            }
        }
    }
    return -1;
}






