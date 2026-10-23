typedef unsigned int u32;
typedef int (*Filter)(void *, int, int);
typedef struct { unsigned int id:13; unsigned int rest:19; } CardBits;
extern unsigned char data_ov002_022ce288[];
extern int data_ov002_022cd524;
struct State { char pad[0xd6c]; int player; };
extern struct State data_ov002_022d016c;
extern unsigned char data_ov002_022cf16c[];
extern u32 func_ov002_02257750(void *ctx, Filter cb);
extern unsigned int func_0202b8a8(int id);
extern int func_0202e2c8(int unused0);
/* This caller supplies two arguments to the four-argument forwarding thunk. */
extern int func_ov002_021c84e0();
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
extern void func_ov002_02259774(int bit0, int val5, int val8, int flag);
extern void func_ov002_02259834(void);
extern int func_ov002_0228cdc0(int player, u32 mask, int flag);
extern int func_ov002_0228d0ac(int player, u32 mask, int flag);
extern int func_ov002_0228cf94(int player, u32 mask);
extern int func_ov002_0228c584(int player, u32 mask, int attack, int defense);
extern int func_ov002_0228c864(int arg0, u32 mask, int (*callback)(int,int));
extern int func_ov002_0228cb48(int a, u32 mask);
extern int func_ov002_0228dbe4(int player, int idx);
extern int func_ov002_0228de58(void *self, int arg1);
extern void func_ov002_0228db8c(void *p);
extern int func_ov002_0228dc90(int arg0, int arg1);
void func_ov002_0228fa1c(int player, int card, Filter cb)
{
    int mask;
    int slot, other;
    int result = func_ov002_02257750(*(void **)(data_ov002_022ce288 + 0x48c), cb);
    data_ov002_022cd524 = player;
    mask = result;
    data_ov002_022d016c.player = player;
    switch (card) {
    case 0x140b:
    case 0x15a3:
    case 0x1927:
    case 0x1957:
        switch(card) {
        case 0x1927: {
            int i;
            int shift;
            unsigned char *p = data_ov002_022cf16c + (player & 1) * 0x868;
            shift = player << 4;
            CardBits *id = (CardBits *)(p + 0x30);
            i = 0;
            for (; i < 5; i++, shift++, p += 0x14, id = (CardBits *)((unsigned char *)id + 0x14)) {
                if ((mask & (1u << shift)) && (((*(u32 *)(p+0x40) >> 22)&1) + ((*(u32 *)(p+0x40) >> 23)&1)) && (int)func_0202b8a8(id->id) <= 4) {
                    func_ov002_02259774(player, i, 0, 11); return;
                }
            }
            break;
        }
        case 0x140b: {
            int shift = player << 4;
            int i = 0;
            for (; i < 5; i++, shift++) {
                if ((mask & (1u << shift)) && func_ov002_022536e8((void *)player, card, func_ov002_021c84e0(player, i))) {
                    func_ov002_02259774(player, i, 0, 11); return;
                }
            }
            break;
        }
        case 0x15a3: {
            unsigned char *p = data_ov002_022cf16c + (player & 1) * 0x868;
            int shift = player << 4;
            CardBits *id = (CardBits *)(p + 0x30);
            int i = 0;
            for (; i < 5; i++, shift++, id = (CardBits *)((unsigned char *)id + 0x14)) {
                if ((mask & (1u << shift)) && func_0202e2c8(id->id) == 0) {
                    func_ov002_02259774(player, i, 0, 11); return;
                }
            }
            break;
        }
        case 0x1957: {
            int shift = (player << 4) + 5;
            int i = 5;
            for (; i < 10; i++, shift++) {
                if (mask & (1u << shift)) {
                    func_ov002_02259774(player, i, 0, 11); return;
                }
            }
            break;
        }
        }
    case 0x1:
    case 0x123b:
    case 0x12c5:
    case 0x13a8:
    case 0x13fc:
    case 0x14c5:
    case 0x14e4:
    case 0x158c:
    case 0x164b:
    case 0x167d:
    case 0x169b:
    case 0x16a0:
    case 0x1702:
    case 0x1708:
    case 0x1713:
    case 0x1715:
    case 0x1753:
    case 0x179b:
    case 0x17e1:
    case 0x180e:
    case 0x1835:
    case 0x187e:
    case 0x188c:
    case 0x18ca:
    case 0x1941:
    case 0x19a5:
    case 0x19b5:
    case 0x1a2b:
    case 0x1a2c:
    case 0x1a2d:
    case 0x1a2e:
    case 0x1a61:
    case 0x1aa0:
    case 0x1aa3:
    case 0x1b1e:
    case 0x1b1f:
        other = 1-player;
        slot = func_ov002_0228cdc0(other, mask, 0);
        if (slot >= 0) { func_ov002_02259774(other, slot, 0, 11); return; }
        slot = func_ov002_0228d0ac(player, mask, 0);
        if (slot >= 0) { func_ov002_02259774(player, slot, 0, 11); return; }
        break;
    case 0x1147:
    case 0x11f0:
    case 0x1254:
    case 0x12e3:
    case 0x1436:
    case 0x1470:
    case 0x15df:
    case 0x1711:
    case 0x1738:
    case 0x179f:
    case 0x17b8:
    case 0x17ea:
    case 0x17f2:
    case 0x1878:
    case 0x192e:
    case 0x1a35:
        other = 1-player;
        slot = func_ov002_0228cdc0(other, mask, 1);
        if (slot >= 0) { func_ov002_02259774(other, slot, 0, 11); return; }
        slot = func_ov002_0228cf94(player, mask);
        if (slot >= 0) { func_ov002_02259774(player, slot, 0, 11); return; }
        break;
    case 0x1327:
    case 0x1623:
    case 0x1719:
    case 0x17ec:
    case 0x1aa6:
        other = 1-player;
        slot = func_ov002_0228cdc0(other, mask, 0);
        if (slot >= 0) { func_ov002_02259774(other, slot, 0, 11); return; }
        slot = func_ov002_0228cf94(player, mask);
        if (slot >= 0) { func_ov002_02259774(player, slot, 0, 11); return; }
        break;
    case 0xfff:
    case 0x1391:
    case 0x151e:
        slot = func_ov002_0228c584(player, mask, 1, 0);
        if (slot >= 0) { func_ov002_02259774(player, slot, 0, 11); return; }
        break;
    case 0x140a:
    case 0x1476:
    case 0x148a:
        other = 1-player;
        slot = func_ov002_0228c584(other, mask, -1, -1);
        if (slot >= 0) { func_ov002_02259774(other, slot, 0, 11); return; }
        slot = func_ov002_0228c584(player, mask, 1, 1);
        if (slot >= 0) { func_ov002_02259774(player, slot, 0, 11); return; }
        break;
    case 0x17f5:
        slot = func_ov002_0228c864(player, mask, func_ov002_0228dbe4);
        if (slot >= 0) { func_ov002_02259774(player, slot, 0, 11); return; }
        break;
    case 0x1a98:
        if (*(unsigned short *)(*(unsigned char **)(data_ov002_022ce288+0x48c)+0xc)) { func_ov002_02259834(); return; }
        slot = func_ov002_0228c864(player, mask, (int (*)(int,int))func_ov002_0228de58);
        if (slot >= 0) { func_ov002_02259774(player, slot, 0, 11); return; }
        break;
    case 0x1855:
    case 0x1929:
    case 0x1abb:
    case 0x1af7:
        slot = func_ov002_0228c864(player, mask, (int (*)(int,int))func_ov002_0228db8c);
        if (slot >= 0) { func_ov002_02259774(player, slot, 0, 11); return; }
        break;
    case 0x1768:
    case 0x1928:
    case 0x192a:
    case 0x1a9a:
        slot = func_ov002_0228c864(player, mask, func_ov002_0228dc90);
        if (slot >= 0) { func_ov002_02259774(player, slot, 0, 11); return; }
        break;
    }
    other = 1-player;
        slot = func_ov002_0228cb48(other, mask);
        if (slot >= 0) { func_ov002_02259774(other, slot, 0, 11); return; }
        slot = func_ov002_0228cb48(player, mask);
        if (slot >= 0) { func_ov002_02259774(player, slot, 0, 11); return; }
}
