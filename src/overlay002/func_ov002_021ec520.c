typedef struct {
    unsigned short id;
    unsigned short owner:1;
    unsigned short pad:5;
    unsigned short kind:6;
    unsigned short pad2:4;
    unsigned short pad3:6;
    unsigned short target:9;
    unsigned short pad4:1;
} Card;
typedef struct {
    unsigned int id:13;
    unsigned int flag:1;
    unsigned int pad:8;
    unsigned int target:8;
    unsigned int pad2:2;
} Slot;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_021bc8c8(int, int, int);
extern int func_ov002_021bc618(int);
extern int func_ov002_021bc288(int, int);
/* Original sets only r0-r1; thunk forwards r3 unchanged. */
extern int func_ov002_021c8940();
/* Original sets only r0-r1; thunk forwards r3 unchanged. */
extern int func_ov002_021c84e0();
/* This caller passes the integer owner flag in r0. */
extern int func_ov002_022536e8(int, int, int);
extern int func_ov002_021ba104(int, int, int);
extern int func_ov002_021c93cc(int, int, int);
extern unsigned int func_0202b890(int);
int func_ov002_021ec520(Card *p, int player, int idx) {
    unsigned int side;
    unsigned int off;
    unsigned int id;
    unsigned int kind;
    int v;
    off = idx * 0x14;
    side = (player & 1) * 0x868;
    kind = p->kind;
    id = ((Slot *)(data_ov002_022cf16c + side + 0x30 + off))->id;
    if (kind == 0x23) return 1;
    if (id == 0) return 0;
    if (func_ov002_021bc8c8(p->owner, player, idx) == 0) return 0;
    if (p->owner != player) {
        if (*(unsigned short *)(data_ov002_022cf1a4 + side + off) == 0) return 0;
    }
    if (func_ov002_021bc618(p->owner) == 0) {
        if (p->owner != player) return 0;
        if (func_ov002_021bc288(player, idx) == 0) return 0;
    }
    switch (p->id) {
    case 0x13fc: return func_ov002_021c8940(player, idx) == 10;
    case 0x140b:
    case 0x15a3:
        v = func_ov002_021c84e0(player, idx);
        if (v == 0) return 0;
        return func_ov002_022536e8(p->owner, p->id, v) != 0;
    case 0x1713: return func_ov002_021ba104(player, idx, 0xfc9);
    case 0x1715: return func_ov002_021c8940(player, idx) == 20;
    case 0x187e: return func_ov002_021ba104(player, idx, 0x13c3);
    case 0x1927: return func_ov002_021c93cc(player, idx, 5);
    case 0x19b1:
    case 0x19b5: return func_ov002_021ba104(player, idx, 0x18f6);
    case 0x1a2b:
    case 0x1a2c:
    case 0x1a2d:
    case 0x1a2e:
        if (((Slot *)(data_ov002_022cf16c + side + 0x30 + off))->target * 2 + ((Slot *)(data_ov002_022cf16c + side + 0x30 + off))->flag == p->target) return 0;
        return func_ov002_021c93cc(player, idx, func_0202b890(p->id));
    }
    return 1;
}









