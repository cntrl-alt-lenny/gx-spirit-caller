typedef struct {
    unsigned int id : 13;
    unsigned int rest : 19;
} Card;
typedef struct {
    char pad0[0xc];
    unsigned int count;
} Side;
typedef struct {
    unsigned int count;
    char pad[0x864];
} Cnt;
extern Side data_ov002_022cf16c[];
extern Cnt data_ov002_022cf178[];
extern int func_0202e234(int x);
extern int func_ov002_021b9128(int a, int b);
extern int func_ov002_021ca440(int arg0, int arg1);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_0224e78c(int side)
{
    unsigned int i = 0;
    Card *p;
    Side *s;
    int k;
    unsigned int id;
    if (!(i < data_ov002_022cf178[side & 1].count)) {
        return;
    }
    k = 11;
    s = (Side *)((char *)data_ov002_022cf16c + (side & 1) * 0x868);
    p = (Card *)((char *)s + 0x120);
    do {
        id = p->id;
        if (func_0202e234(id) != 0 && func_ov002_021b9128(id, 3) != 0 && func_ov002_021ca440(side, id) != 0) {
            func_ov002_02253458(side, k, i);
        }
        i++;
        p++;
    } while (i < s->count);
}
