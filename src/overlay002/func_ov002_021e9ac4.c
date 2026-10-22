typedef struct {
    unsigned short f0;
    unsigned short flag0 : 1;
    unsigned short field : 5;
    unsigned short : 10;
} Card021c1e44;
typedef Card021c1e44 Card;
struct node { char pad[8]; unsigned short arr8[5]; unsigned short f18; };
struct Slot { unsigned int id:13; unsigned int rest:19; char pad[16]; };
struct Board { char pad[0x30]; struct Slot slots[5]; char tail[0x7d4]; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1a2[];
extern int func_ov002_021c1e44(Card021c1e44 *, int, int);
extern int func_ov002_021c2084(Card *, int, int, int);
/* The original supplies two arguments to these four-argument thunks. */
extern int func_ov002_021c8940();
extern int func_ov002_021c84e0();
extern int func_ov002_021c92ec();
extern int func_ov002_021b3314(int, int);
extern int func_ov002_021c84a8(int, int);
extern int func_ov002_021b9ecc(int, int);
extern int func_0202ee40(int);
extern unsigned short func_ov002_0223de94(struct node *, int);
extern int func_ov002_021c93cc(int, int, int);
extern unsigned int func_0202b890(int);
int func_ov002_021e9ac4(Card *self, int player, int idx) {
    int side;
    int slot;
    int kind;
    unsigned short id;
    if (idx >= 5) return 0;
    slot = idx * 20;
    side = (player & 1) * 0x868;
    if (((struct Board *)data_ov002_022cf16c)[player & 1].slots[idx].id == 0) return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + side + slot) == 0) return 0;
    if (func_ov002_021c1e44(self, player, idx) != 0) return 0;
    if (func_ov002_021c2084(self, player, idx, 0) == 0) return 0;
    kind = func_ov002_021c8940(player, idx);
    id = self->f0;
    switch (id) {
    case 0x1542: return 1;
    case 0x1236:
    case 0x166d: return func_ov002_021b3314(player, idx) > 0;
    case 0x14e4: return func_ov002_021c84a8(player, idx) <= *(unsigned short *)((char *)self + 8);
    case 0x1233: return kind == 15;
    case 0x123a: return kind == 7;
    case 0x123c: return kind == 10;
    case 0x123d: return kind == 6;
    case 0x123e: return kind == 8;
    case 0x1304: return kind == 18;
    case 0x1305: return kind == 3;
    case 0x161c: return kind == *(unsigned short *)((char *)self + 8);
    case 0x1945:
        if (func_0202ee40(func_ov002_021b9ecc(player, idx)) != 0) {
            if ((unsigned short)((unsigned char)player | ((unsigned char)idx << 8)) != func_ov002_0223de94((struct node *)self, 0)) return 1;
        }
        return 0;
    case 0x1977:
        if (*(unsigned short *)(data_ov002_022cf1a2 + side + slot) != 0) return 0;
        return func_ov002_021c84e0(player, idx) == 3;
    case 0x197d: return func_ov002_021c93cc(player, idx, *(unsigned short *)((char *)self + 8));
    case 0x1b45:
    case 0x1b46:
    case 0x1b47:
    case 0x1b48:
    case 0x1b49:
    case 0x1b4a:
        { int value = func_ov002_021c92ec(player, idx);
        return value != func_0202b890(id); }
    }
    return 0;
}



