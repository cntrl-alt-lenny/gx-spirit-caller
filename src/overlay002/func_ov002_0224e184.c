typedef struct {
    unsigned int id : 13;
    unsigned int lo : 1;
    unsigned int mid : 8;
    unsigned int hi : 8;
    unsigned int top : 2;
} Card;
typedef struct {
    char pad0[0x14];
    unsigned int count;
    Card cards[1];
} Side;
typedef struct {
    unsigned int count;
    char pad[0x864];
} Cnt;
extern Side data_ov002_022cf16c[];
extern Cnt data_ov002_022cf180[];
extern int func_0202f9e8(int id);
extern void func_ov002_02253458(int player, int kind, int idx);
void func_ov002_0224e184(int side, int unused, int excluded)
{
    unsigned int i = 0;
    Card *p;
    Side *s;
    int k;
    if (!(i < data_ov002_022cf180[side & 1].count)) {
        return;
    }
    k = 14;
    s = (Side *)((char *)data_ov002_022cf16c + (side & 1) * 0x868);
    p = (Card *)((char *)s + 0x418);
    do {
        if (func_0202f9e8(p->id) == 1) {
            if (excluded != p->hi * 2 + p->lo) {
                func_ov002_02253458(side, k, i);
            }
        }
        i++;
        p++;
    } while (i < s->count);
}
