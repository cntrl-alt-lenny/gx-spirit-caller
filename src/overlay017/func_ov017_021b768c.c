typedef struct {
    unsigned int a;
    unsigned int b;
    unsigned char _pad8[0x14];
    struct { unsigned int low8 : 8; unsigned int : 24; };
    unsigned char _pad20[4];
    struct { unsigned int : 17; unsigned int mid4 : 4; unsigned int : 11; };
} state_t;
extern state_t data_02102c90;
extern void func_02001d0c(state_t *p, int a, int b);
extern void func_02005088(int a0, int a1, int a2, int a3, int a4, int a5);
extern int func_020054a4(int text, int size);
extern int func_0202c0c0(int index);
extern char *func_0208df0c(void);
extern void func_02094504(int value, void *dest, int size);

void func_ov017_021b768c(char *self) {
    int x;
    int width;
    int text;
    func_02094504(0, func_0208df0c() + 0xdc0, 0x500);
    x = 0;
    func_02001d0c(&data_02102c90, 0x14, 2);
    width = 0x90 - func_020054a4(func_0202c0c0(*(int *)(self + 0x1d4) + 0x76c), 0xc);
    if (width >= 0x14) {
        x += 0x14;
    } else {
        x += width;
        x -= 2;
    }
    text = func_0202c0c0(*(int *)(self + 0x1d4) + 0x76c);
    func_02005088((int)&data_02102c90, text, (int)(func_0208df0c() + 0xdc0), x + 6, 1, 0xc);
}


