typedef struct { int f_0; char pad[6]; unsigned short h_a; } state_0_a_t;
typedef struct { char pad[8]; int f_8; int f_c; } state_8_c_t;
struct Func0208b0a4Self { int f0; int f4; int f8; int f12; };
struct Func02087790Obj { char pad[0x2c]; unsigned char f2c; char pad2[15]; unsigned char f3c; };
extern int func_0207cfdc(state_0_a_t *p, char *q);
extern void func_02087690(char *a0);
extern void func_02087790(struct Func02087790Obj *p);
extern int func_0208b040(state_8_c_t *p);
extern void func_0208b058(state_8_c_t *p);
extern int func_0208b070(struct Func0208b0a4Self *self);
extern int func_020951e8(int a, int b);
extern void func_02095244(int a0);
extern int func_02095554(unsigned int arg);
extern int func_02095d34(void);
extern state_0_a_t data_021a4868;
extern short data_020c31f8[];
void func_02087ab4(void) {
    int mask = func_02095d34();
    char *p = (char *)func_0207cfdc(&data_021a4868, 0);
    char *next;
    int d, c, b, a, value;
    int ia, ib, ic;
    char *inner;
    if (p == 0) return;
    do {
        next = (char *)func_0207cfdc(&data_021a4868, p);
        if ((unsigned char)p[0x2d] == 0) {
            if (func_02095554(*(unsigned int *)(p+0x30)) != 0) p[0x2d] = 1;
        }
        if ((unsigned char)p[0x2d] != 0 && (mask & (1 << (unsigned char)p[0x3c])) == 0) {
            func_02087690(p);
        } else {
            func_0208b058((state_8_c_t *)(p+0x1c));
            inner = *(char **)(p+4);
            ic = (unsigned char)p[0x41];
            ib = (unsigned char)p[0x40];
            ia = (unsigned char)inner[0x20];
            c = data_020c31f8[ic];
            b = data_020c31f8[ib];
            a = data_020c31f8[ia];
            d = func_0208b070((struct Func0208b0a4Self *)(p+0x1c));
            d = data_020c31f8[d >> 8];
            value = (a + (b+c)) + d;
            if (value < -32768) value = -32768;
            else if (value > 32767) value = 32767;
            if (value != *(short *)(p+0x3e)) {
                func_020951e8((unsigned char)p[0x3c], value);
                *(short *)(p+0x3e) = value;
            }
            if ((unsigned char)p[0x2c] == 2 && func_0208b040((state_8_c_t *)(p+0x1c)) != 0) func_02087790((struct Func02087790Obj *)p);
            if ((unsigned char)p[0x2f] != 0) {
                func_02095244((unsigned char)p[0x3c]);
                p[0x2f] = 0;
            }
        }
        p = next;
    } while (p != 0);
}










