typedef unsigned short u16;
struct node { u16 id; u16 side:1, rest:15; u16 a:2, skip:1, b:13; u16 f6; u16 arr8[5]; u16 f18; };
struct State { char pad[0x5a8]; int state; };
struct Card { unsigned int id:13, rest:19; };
struct Player { char pad[0x120]; struct Card first[80]; struct Card second[80]; struct Card third[306]; };
struct Count { int count; char pad[0x864]; };
extern struct State data_ov002_022ce288;
extern struct Player data_ov002_022cf16c[];
extern struct Count data_ov002_022cf178[], data_ov002_022cf17c[], data_ov002_022cf184[];
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_0202df78(int a, int b);
extern int func_0202e2c8(int unused0);
extern int func_0202e2f8(int unused0);
extern void *func_ov002_021c93f0(int player, int kind, int extra);
/* The original passes a player index, rather than a self pointer. */
extern void func_ov002_021e2550(int self, int a, int b, int c);
extern void func_ov002_021e2570(int a, int b, int c);
extern void func_ov002_021e25b0(int a, int b, int c);
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_021e2b1c(int arg0);
int func_ov002_02215540(struct node *p) {
    int side = (unsigned char)func_ov002_0223de94(p,0);
    int card = p->arr8[2];
    if (p->skip) return 0;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_0202e2f8(card)) return 0;
    case 0x7f: {
        int i;
        for (i=data_ov002_022cf178[side&1].count-1; (int)i>=0; i--) {
            if (func_0202df78(data_ov002_022cf16c[side&1].first[i].id,card)) {
                void *v = func_ov002_021c93f0(side,11,i);
                func_ov002_021e2550(side,i,(int)v,side != p->side);
            }
        }
        return 0x7e;
    }
    case 0x7e: {
        struct Card *entry;
        unsigned int i;
        i=data_ov002_022cf17c[side&1].count-1;
        if ((int)i>=0) {
        entry=&data_ov002_022cf16c[side&1].second[i];
        do {
            if (func_0202df78(entry->id,card))
                func_ov002_021e2570(side,i,side != p->side);
            entry--;
        } while ((int)--i>=0);
        }
        for (i=data_ov002_022cf184[side&1].count-1; (int)i>=0; i--) {
            if (func_0202df78(data_ov002_022cf16c[side&1].third[i].id,card))
                func_ov002_021e25b0(side,i,side != p->side);
        }
        return 0x7d;
    }
    case 0x7d:
        if (!func_0202e2c8(card)) {
            func_ov002_021e2b1c(15);
            func_ov002_021e286c(side);
        }
        return 0x78;
    }
    return 0;
}




