typedef struct {
    unsigned int type;
    unsigned short a;
    unsigned short b;
    unsigned short c;
    unsigned char pad[12];
    unsigned short d;
    unsigned char e;
    unsigned char f;
    unsigned char g;
    unsigned char tail;
} Params;

extern void Fill32(int value, void *dst, int size);
extern int func_0209f514(void *param0, void *param1, int param2, int param3, unsigned short param4, void *param5);

int func_0209f470(void *a0, void *a1, int a2, int a3,
    unsigned short a4, unsigned short a5, unsigned short a6,
    int a7, int a8, int a9, int a10)
{
    Params p;
    Fill32(0, &p, sizeof(Params));
    p.type = 0x1e03;
    p.a = a5;
    p.b = a5;
    p.d = a6;
    p.e = a7;
    p.f = a8;
    p.g = a10;
    if (a9) { p.type |= 4; p.c = a5; }
    return func_0209f514(a0, a1, a2, a3, a4, &p);
}

