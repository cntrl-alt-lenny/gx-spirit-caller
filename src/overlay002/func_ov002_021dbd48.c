typedef unsigned int u32;
typedef unsigned short u16;
typedef struct {
    u16 f0;
    u16 flag0:1;
    u16 field:5;
    u16 rest:8;
    u16 flag14:1;
    u16 unused:1;
    u16 pad:4;
    u16 flag4:1;
    u16 rest4:11;
} Card021c1e44;
typedef struct { u32 id:13; u32 rest:19; } Entry;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern char data_ov002_022cf1ac[];
extern char data_ov002_022d016c[];
extern unsigned int func_0202b878(int id);
extern int func_ov002_021bae7c(int player, int code, int arg);
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
extern int func_ov002_021c2084(Card021c1e44 *a0, int a1, int a2, int a3);
/* Original caller supplies the card id as a third, unused argument. */
extern int func_ov002_021c2330(int self, int arg1, int id);
int func_ov002_021dbd48(Card021c1e44 *a, int player, int slot, int mode, int check)
{
    int off = (player & 1) * 0x868;
    int row = slot * 20;
    int id = ((Entry *)(data_ov002_022cf16c + off + 0x30 + row))->id;
    if (id == 0) return 0;
    if (*(u32 *)(data_ov002_022d016c + 0xd4) & (1 << (slot + (player << 4)))) return 0;
    if (func_ov002_021c1e44(a, player, slot) != 0) return 0;
    if (check != 0) {
        if (func_ov002_021c2084(a, player, slot, 0) == 0) return 0;
    }
    if (mode == 15) {
        if (func_ov002_021c2330(player, slot, a->f0) == 0) return 0;
    }
    if (check != 0 && id == 0x169f && *(u16 *)(data_ov002_022cf1a4 + off + row) != 0 && player == 1 - (a->flag0 ^ a->flag14)) {
        if (func_ov002_021bae7c(player, 0x1683, -1) != 0) return 0;
    }
    if (a->flag4 && check != 0 && player == 1 - (a->flag0 ^ a->flag14) && slot >= 5 && func_0202b878(id) == 0x17) {
        if (id != 0x1258 || !((*(u32 *)(data_ov002_022cf1ac + off + row) >> 3) & 1)) return 0;
    }
    return 1;
}




