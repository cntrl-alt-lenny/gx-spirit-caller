typedef struct {
    int type;
    unsigned short a;
    unsigned short b;
    char pad[0x1c - 8];
} Params;

extern void Fill32(int value, void *dst, int size);
extern void func_0209f514(int a0, int a1, int a2, int a3, int a4, Params *params);

void func_0209f404(int a0, int a1, int a2, int a3, unsigned short a4, unsigned short a5) {
    Params p;
    Fill32(0, &p, sizeof(Params));
    p.type = 3;
    p.a = a5;
    p.b = a5;
    func_0209f514(a0, a1, a2, a3, a4, &p);
}
