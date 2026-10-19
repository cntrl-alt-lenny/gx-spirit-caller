extern void *func_0208e220(void);
extern void *func_0208e200(void);
typedef struct { int pad[3]; int count; } State;
int func_ov003_021cc010(State *s) {
    unsigned short *a = func_0208e220();
    unsigned short *b = func_0208e200();
    int y, x;
    s->count += s->count < 64;
    for (y = 23; y >= 0; y--) {
        for (x = 0; x < 32; x++) {
            int n = (s->count >> 1) - (23-y);
            if (n > 0 && n <= 8) a[(23-y)*32+x] = (n+2)|0x2800;
            if (n > 0 && n <= 8) b[y*32+x] = (n+2)|0x2000;
        }
    }
    if (s->count >= 64) { s->count = 0; return 1; }
    return 0;
}
