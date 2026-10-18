struct Ov002Self { unsigned short f0; unsigned short b0 : 1; };
typedef struct { unsigned short f0; unsigned short flag0 : 1; unsigned short field : 5; unsigned short : 10; } Card021c1e44;
struct slot { unsigned int id : 13; char pad[16]; };
struct side { char hdr[0x30]; struct slot rows[1]; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a2[];
extern int func_0202e2f8(int unused0);
extern int func_ov002_021c9dac(int player);
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
extern int func_ov002_021d63fc(struct Ov002Self *self, int arg1, int arg2, int arg3);
extern int func_ov002_021d6808(struct Ov002Self *self, int player, int idx, int arg3, int arg4);
void func_ov002_021d6c98(struct Ov002Self *self, int player, int idx) {
    int off = (player & 1) * 0x868;
    int roff = idx * 20;
    int flag = func_0202e2f8(((struct side *)(data_ov002_022cf16c + off))->rows[idx].id) == 0;
    if (func_ov002_021c9dac(self->b0) == 0) return;
    if (func_ov002_021c1e44((Card021c1e44 *)self, player, idx) != 0) return;
    if (flag && *(unsigned short *)(data_ov002_022cf1a4 + off + roff) != 0) {
        if (*(unsigned short *)(data_ov002_022cf1a2 + off + roff) != 0) {
            func_ov002_021d63fc(self, player, idx, 0);
        } else {
            func_ov002_021d6808(self, player, idx, 1, 0);
        }
    } else {
        if (*(unsigned short *)(data_ov002_022cf1a2 + off + roff) == 0)
            func_ov002_021d6808(self, player, idx, 0, 0);
    }
}

