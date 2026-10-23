typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u32 id:13; u32 rest:19; int words[4]; } Card;
typedef struct { char pad[0x30]; Card cards[11]; } Player;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern int data_ov002_022cd73c[];
extern int func_ov002_021bd710(int, int);
extern int func_ov002_021c2798(int, int, unsigned int, unsigned int);
/* The original caller supplies a third argument, although the C definition uses two. */
extern int func_ov002_021c2850(int, int, int);
extern void func_ov002_021c4c9c(int, int, int *);
extern int func_ov002_021c7f48(int *, int, int, int, int);
void func_ov002_021c820c(int a, int b, u16 out[2][11]) {
    int first[11];
    int other[11];
    int i, j;
    int off, slot;
    Card *row;
    for (i = 0; i < 2; i++) {
        for (j = 0; j <= 10; j++) out[i][j] = 0;
    }
    if (b > 10) return;
    off = (a & 1) * 0x868;
    slot = b * 20;
    if (((Player *)(data_ov002_022cf16c + off))->cards[b].id == 0) return;
    if (b < 5 && func_ov002_021bd710(a,b) != 0) {
        out[a][b] = 7;
    } else if (*(u16 *)(data_ov002_022cf1a4 + off + slot) != 0) {
        if ((*(u32 *)(data_ov002_022cf1ac + off + slot) >> 6) & 1) out[a][b] = 7;
    } else if (a == data_ov002_022cd73c[1] && b >= 5 && func_ov002_021c2850(a,b,0) != 0) {
        out[a][b] = 7;
    }
    func_ov002_021c4c9c(a,b,first);
    for (i = 0; i < 2; i++, out++) {
        row = (Card *)(data_ov002_022cf16c + (i & 1)*0x868 + 0x30);
        for (j = 0; j <= 10; j++, row++) {
            if (row->id != 0) {
                func_ov002_021c4c9c(i,j,other);
                if (out[0][j] == 0) out[0][j] = func_ov002_021c7f48(other,i,j,a,b);
                if (out[0][j] == 0) out[0][j] = func_ov002_021c7f48(first,a,b,i,j);
                if (func_ov002_021c2798(i,j,a,b) != 0) out[0][j] |= 0x100;
            }
        }
    }
}





