typedef struct {
    unsigned short a:1, b:5, c:8, d:1, e:1;
} Bits;
typedef struct {
    unsigned char active;
    char pad[0x27];
    Bits bits;
    short count;
} Obj;
extern int func_ov002_021c988c(int player, int kind, int extra);
void func_ov002_0229e5a0(Obj *p, int player, int kind) {
    Bits bits;
    int flag;
    p->count = 0;
    flag = func_ov002_021c988c(player, kind, 0);
    bits.a = (unsigned short)player;
    bits.b = (unsigned short)kind;
    bits.c = 0;
    bits.d = (unsigned short)flag;
    bits.e = 0;
    p->bits = bits;
    p->active = 0;
}
