typedef unsigned int u32;
typedef unsigned short u16;
struct Bits { u32 id:13; u32 flag:1; u32 pad:8; u32 idx:8; u32 rest:2; };
struct Player { char pad[0x10]; u32 count; char pad14[0x24c]; struct Bits cards[1]; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a8[];
extern int func_ov002_021b3fd8(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_021ba104(int a, int b, int c);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
extern void func_ov002_021d5b80(int arg0, int arg1, int arg2, int arg3);
void func_ov002_02254efc(int a, int b)
{
    int i, j, card;
    struct Bits *p;
    int v;
    struct Bits *p2;
    struct Player *q;
    int n, k;
    if (((struct Bits *)((int)data_ov002_022cf16c + (a & 1) * 0x868 + b * 20 + 0x30))->id != 0x1368) return;
    card = *(int *)(data_ov002_022cf1a8 + (a & 1) * 0x868 + b * 20);
    func_ov002_021d5b80(a, b, 0x1368, 1);
    for (i = 0; i < 2; i++) {
        p = (struct Bits *)(data_ov002_022cf16c + (i & 1) * 0x868 + 0x30);
        for (j = 0; j <= 10; j++) {
            if (func_ov002_021ba104(i, j, card) != 0) {
                func_ov002_021d59cc(a, b, 0x1368, 3, (u16)(p->idx * 2 + p->flag));
            }
            p = (struct Bits *)((char *)p + 20);
        }
    }
    if (card != 0x12a1) return;
    for (k = 0; k < 2; k++) {
        q = (struct Player *)(data_ov002_022cf16c + (k & 1) * 0x868);
        n = 0;
        if (n < q->count) {
        p2 = q->cards;
        do {
            v = p2->idx * 2 + p2->flag;
            if (func_ov002_021b3fd8(k, 11, 0x12a1, v) != 0) {
                func_ov002_021d59cc(a, b, 0x1368, 3, (u16)v);
            }
            n++;
            p2++;
        } while (n < q->count);
        }
    }
}






