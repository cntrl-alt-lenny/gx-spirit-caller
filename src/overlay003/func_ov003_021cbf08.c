typedef struct { int pad[3]; int count; } State;
extern int func_02036590(unsigned int id, int arg);
extern void *func_0208e220(void);
extern void *func_0208e200(void);
extern void func_02094504(int value, void *dest, unsigned int size);
int func_ov003_021cbf08(State *s) {
    unsigned short *a = func_0208e220();
    unsigned short *b = func_0208e200();
    int n, y, x;
    if (s->count == 0) func_02036590(0x8f00000, 0x20);
    s->count += s->count < 0x40;
    for (y = 23; y >= 0; y--) {
        for (x = 0; x < 32; x++) {
            n = (s->count >> 1) - (23-y);
            if (n > 0 && n <= 8) a[y*32+x] = (10-n) | 0x2800;
            if (n > 0 && n <= 8) b[(23-y)*32+x] = (10-n) | 0x2000;
        }
    }
    if (s->count < 0x40) return 0;
    func_02094504(0, a, 0x800);
    func_02094504(0, b, 0x800);
    s->count = 0;
    return 1;
}

