typedef unsigned short u16;
typedef struct { unsigned int id:13; unsigned int b:1; unsigned int mid:8; unsigned int c:8; unsigned int top:2; } Card;
typedef struct { char pad0[0x30]; struct { Card c; int pad[4]; } slot[5]; char pad1[0x384]; Card extra[1]; char tail[0x44c]; } Side;
extern Side data_ov002_022cf16c[];
extern struct { char pad0[0x48c]; u16 *cur; int unknown490; unsigned int start; u16 q[0x80]; char pad1[0x114]; unsigned int count; } data_ov002_022ce288;
extern int func_ov002_021b9ecc(int a, int b);
extern int func_ov002_021bd710(int a, int b);
extern int func_ov002_0223b6ec(int a, int b, int c);
extern int func_ov002_021c1d28(int a, int b, int c);
extern int func_ov002_021c2330(int self, int arg1, int unused2);
extern int func_ov002_021bd85c(int a, int b);
extern int func_ov002_0223b5cc(int a, int b);
extern int func_ov002_021bc6c4(int a);
extern int func_ov002_021bc288(int a, int b);
int func_ov002_0223c72c(int player, int kind, int idx) {
    int r4;
    int n;
    Card *w;
    int id; int i; unsigned int start; unsigned int cnt;
    n = kind + idx;
    if (n <= 4) {
        if (func_ov002_021b9ecc(player, n) == 0) return 0;
        w = &data_ov002_022cf16c[player & 1].slot[n].c;
        r4 = w->c * 2 + w->b;
        if (func_ov002_021bd710(player, n) != 0) return 0;
        if (func_ov002_0223b6ec(player, n, 0) == 0) return 0;
        if (func_ov002_021c1d28(player, n, 0) != 0) return 0;
        if (func_ov002_021c2330(player, n, *data_ov002_022ce288.cur) == 0) return 0;
    } else if (kind == 14) {
        w = &data_ov002_022cf16c[player & 1].extra[idx];
        id = w->id;
        r4 = w->c * 2 + w->b;
        if (func_ov002_021bd85c(id, r4) != 0) return 0;
        if (func_ov002_0223b5cc(id, 0) == 0) return 0;
    } else {
        return 0;
    }
    cnt = data_ov002_022ce288.count;
    i = 0;
    if (i < cnt) {
        start = data_ov002_022ce288.start;
        do {
            if (r4 == data_ov002_022ce288.q[(start + i) & 0x7f]) return 0;
            i++;
        } while (i < cnt);
    }
    if (func_ov002_021bc6c4(player) < 0 && data_ov002_022ce288.count == 0) {
        if (n > 4) return 0;
        if (func_ov002_021bc288(player, n) == 0) return 0;
    }
    return 0x800;
}


