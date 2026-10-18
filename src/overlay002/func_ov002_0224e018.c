typedef struct {
    unsigned int id : 13;
    unsigned int rest : 19;
} Card;

typedef struct {
    char pad0[0x14];
    unsigned int count;
    Card cards[1];
} Side;

typedef struct {
    int count;
    char pad[0x864];
} Cnt;

extern Side data_ov002_022cf16c[];
extern Cnt data_ov002_022cf180[];
extern int func_0202e234(int x);
extern int func_0202de9c(int x);
extern int func_0202b8a8(int x);
extern int func_ov002_021c33e4(int a, int b, int c);
extern void func_ov002_02253458(int a, int b, int c);

void func_ov002_0224e018(int side)
{
    unsigned int i = 0;
    Card *p;
    Side *s;
    int k;
    unsigned int id;

    if (!(i < (unsigned int)data_ov002_022cf180[side & 1].count)) {
        return;
    }
    k = 14;
    s = (Side *)((char *)data_ov002_022cf16c + (side & 1) * 0x868);
    p = (Card *)((char *)s + 0x418);
    do {
        id = p->id;
        if (func_0202e234(id) != 0 && func_0202de9c(id) == 0 && func_0202b8a8(id) <= 3) {
            if (func_ov002_021c33e4(side, side, i) != 0) {
                func_ov002_02253458(side, k, i);
            }
        }
        i++;
        p++;
    } while (i < s->count);
}
