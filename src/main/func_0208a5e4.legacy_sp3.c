typedef unsigned char u8;
typedef unsigned short u16;
typedef struct Rec {
    u8 n;
    u8 pad1;
    u16 h2;
    int f4;
} Rec;

extern void func_020893f0(void);
extern Rec *func_02089198(int i);
extern void func_02087fe0(int i, int v);
extern void func_02087fc8(int i, int v);
extern int func_02087f34(int i, int a, int b);

int func_0208a5e4(int arg)
{
    int i;
    Rec *r;
    int j;
    func_020893f0();
    for (i = 0; i < 0x20; i++) {
        r = func_02089198(i);
        if (r != 0) {
            func_02087fe0(i, r->n);
            func_02087fc8(i, r->h2);
            if (r->f4 != 0 && arg != 0) {
                for (j = 0; j < r->n; j++) {
                    if (func_02087f34(i, arg, r->f4) == 0) {
                        return 0;
                    }
                }
            }
        }
    }
    return 1;
}
