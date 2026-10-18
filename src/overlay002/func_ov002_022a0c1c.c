typedef unsigned int u32;

typedef struct { int pad0[9]; int count; int pad1[2]; int row; } Self;
typedef struct { int pad0[2]; int a; int b; } Data;

extern Data data_02102c90;
extern void *func_ov002_021afbd4(int i);
extern void func_ov002_0229cfa0(char *buf, void *obj);
extern int func_020aaddc(char *buf);
extern int func_0208de4c(void);
extern void func_02001d0c(Data *d, int a, int b);
extern int func_0202b7cc(void *obj);
extern void func_02005188(Data *d, int a, int b, int c, int e, int f);

int func_ov002_022a0c1c(Self *self)
{
    char buf[0x100];
    void *best = 0;
    int bestLen = 0;
    int i;
    int base;

    for (i = 0; i < self->count; i++) {
        void *obj = func_ov002_021afbd4(i);
        if (obj) {
            int len;
            func_ov002_0229cfa0(buf, obj);
            len = func_020aaddc(buf);
            if (bestLen < len) {
                bestLen = len;
                best = obj;
            }
        }
    }

    base = func_0208de4c() + (((self->row << 5) + 1) << 6);
    func_02001d0c(&data_02102c90, 0x18, 0x12);
    func_02005188(&data_02102c90, func_0202b7cc(best), base, 0, 4, 0xc);
    return (int)((u32)(((data_02102c90.a != 0) ? 1 : 0) * 0xc + data_02102c90.b + 7) >> 3) - 1;
}
