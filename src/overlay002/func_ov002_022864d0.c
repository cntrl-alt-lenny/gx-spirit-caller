typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { u32 id:13; u32 flag:1; u32 unused:8; u32 slot:8; u32 rest:2; } Card;
typedef struct { char pad[0xc]; u32 count; char pad2[0x110]; Card cards[1]; } Row;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int func_0202e234(int x);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021bca00(int self, int id, int player, int slot);
extern int func_ov002_021c38c4(int side, int index);
extern int func_ov002_0226eb48(int a, int b);
extern int func_ov002_0227b174(int player, int attack, int defense);
extern int func_ov002_0227b9b8(int a, int b, int c, int d);
extern int func_ov002_0227c678(int a, int b, u16 c);
/* The existing void definition omits the return value consumed here. */
extern int func_ov002_0227d660(int self, int arg);
extern int func_ov002_0227d6f8(int a, int card, int mode, int count, u16 *list);
extern int func_ov002_0227d8c4(int player, int slot, int flag);
extern void func_ov002_02280a1c(int player, int *attack, int *defense, int flag);
extern void func_ov002_02286110(int a, int id, int n, void *entries, int *out);
extern int func_ov002_0228635c(int player, int card);
extern int func_ov002_0228c460(int player);
int func_ov002_022864d0(int player, int *out) {
    int stats[11];
    unsigned int i;
    int otherAttack;
    int ownAttack;
    int ownDefense;
    u16 list[3];
    int selected = -1;
    int flags;
    int valid;
    int can;
    int max;
    int id;
    int count;
    int n;
    int packed;
    int power;
    int mode;
    Row *row;
    can = func_ov002_0227d660(player, 1) != -1;
    func_ov002_02280a1c(1-player, &otherAttack, (int *)&i, 0);
    func_ov002_02280a1c(player, &ownAttack, &ownDefense, 0);
    max = ownAttack > ownDefense ? ownAttack : ownDefense;
    i = 0;
    if (i < *(u32 *)(data_ov002_022cf178 + (player & 1)*0x868)) {
    row = (Row *)(data_ov002_022cf16c + (player & 1)*0x868);
    do {
        id = row->cards[i].id;
        if (func_0202e234(id) == 0) continue;
        if (func_ov002_0227c678(player, 2, (u16)id) != 0) continue;
        flags = func_ov002_0226eb48(player, row->cards[i].slot*2 + row->cards[i].flag);
        if (!flags) continue;
        count = func_ov002_0227d8c4(player, row->cards[i].slot*2 + row->cards[i].flag, 1);
        valid = 1;
        for (n=0; n<count; n++) {
            packed = func_ov002_0227d6f8(player,id,0,n,list);
            if (packed < 0) { valid=0; break; }
            if (func_ov002_021bca00(player,id,(unsigned char)packed,(unsigned char)((u16)packed >> 8))) list[n++]=packed;
            list[n]=packed;
        }
        if (!valid) continue;
        mode=func_ov002_0227b9b8(player,id,0,0);
        func_ov002_02286110(player,id,count,list,stats);
        if (mode == -1) {
            mode=func_ov002_0227b174(player,stats[5],stats[6]);
            if (mode == -1) mode=stats[5] <= stats[6];
        }
        mode = !mode;
        if (flags == 0x10 && mode == 0) continue;
        if (flags == 0x40 && mode != 0) continue;
        power = stats[5] > stats[6] ? stats[5] : stats[6];
        if (can && count != 0) { selected=i; *out=mode == 0; }
        if (power > otherAttack) { selected=i; *out=mode == 0; }
        if (func_ov002_0228635c(player,id)) { selected=i; *out=mode == 0; }
        if (power > max) { selected=i; *out=mode == 0; }
        if (count == 0) { selected=i; *out=mode == 0; }
    } while (++i < row->count);
    }
    if (selected > -1) return selected;
    if (func_ov002_021bc618(player)) {
        unsigned int card;
        mode = func_ov002_0228c460(player) ? 1 : 2;
        i=0;
        if (i < *(u32 *)(data_ov002_022cf178 + (player & 1)*0x868)) {
        row = (Row *)(data_ov002_022cf16c + (player & 1)*0x868);
        do {
            card=row->cards[i].id;
            if (!func_0202e234(card)) continue;
            if (func_ov002_021c38c4(player,row->cards[i].slot*2 + row->cards[i].flag) > 4) continue;
            if (func_ov002_0227c678(player,mode,(u16)card)) continue;
            flags=func_ov002_0226eb48(player,row->cards[i].slot*2 + row->cards[i].flag);
            if (!flags) continue;
            *out=(flags & 0x40) != 0;
            return i;
        } while (++i < row->count);
        }
    }
    return -1;
}






