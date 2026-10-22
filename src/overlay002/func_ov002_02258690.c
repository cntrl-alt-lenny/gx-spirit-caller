typedef unsigned int u32;
typedef struct { u32 low:13; u32 side:1; u32 middle:8; u32 index:8; u32 high:2; } Entry;
typedef struct { char pad[0xcf8]; int phase; char pad2[0x84]; int error; } State;
extern State data_ov002_022d016c;
extern int data_ov002_022cd73c[];
typedef struct { char pad[0x120]; Entry entries[1]; } Row;
extern Row data_ov002_022cf16c[];
extern char data_ov002_022cf288[];
extern unsigned int func_0202b878(int id);
extern unsigned int func_0202b8c0(int id);
extern int func_0202e234(int x);
extern int func_0203058c(int a);
extern int func_02031470(int x);
extern int func_020317c0(int x);
extern int func_ov002_021b3ecc(int arg0,int arg1,int arg2);
extern int func_ov002_021b8f80(int arg0);
extern int func_ov002_021bd110(int player,int arg1);
extern int func_ov002_021bd85c(int a,int b);
extern int func_ov002_021c9be8(int arg0,int arg1);
extern int func_ov002_021c9c48(int arg0);
extern int func_ov002_021fd74c(int a,int b,int c);
extern int func_ov002_0226eb48(int a,int b);
extern int func_ov002_0226f4dc(int a,int b);
int func_ov002_02258690(int card,int player,int slot)
{
    int offset = (player & 1) * 0x868;
    Entry *entry = &((Row *)((char *)data_ov002_022cf16c + offset))->entries[slot];
    int result;
    int index = entry->index * 2 + entry->side;
    result = 0;
    if (player == (data_ov002_022cd73c[1] ^ 1)) return 0;
    if (func_ov002_021bd85c(card,-1)) {
        if (player == data_ov002_022cd73c[1]) data_ov002_022d016c.error=0x10;
        return 0;
    }
    if (!func_ov002_021c9be8(player,card)) {
        if (player == data_ov002_022cd73c[1]) data_ov002_022d016c.error=0x17;
        return 0;
    }
    switch (data_ov002_022d016c.phase) {
    case 2:
    case 4:
        {
        int type = func_0202b878(card);
        switch (type) { case 0x16: case 0x17:
            if (func_ov002_021bd110(player,card)) {
                if (func_ov002_021fd74c(player,slot,card)) result |= 8;
                if (func_ov002_021c9c48(player)) {
                    if (!func_ov002_021b8f80(card)) result |= 0x80;
                }
            } else { data_ov002_022d016c.error=0xc; }
        break; default:
            if (func_0203058c(card)) {
                data_ov002_022d016c.error=0xd;
                result |= func_ov002_0226f4dc(player,index);
            } else if (!((*(u32 *)(data_ov002_022cf288 + offset) >> 17) & 1)) {
                result |= func_ov002_0226eb48(player,index);
                result |= func_ov002_0226f4dc(player,index);
            } else {
                data_ov002_022d016c.error=2;
                result |= func_ov002_0226f4dc(player,index);
            }
            if (func_020317c0(card) && func_ov002_021bd110(player,card) && func_ov002_021c9c48(player)) result |= 0x80;
            if (func_02031470(card)) {
                if (func_ov002_021fd74c(player,slot,card)) result |= 8;
            }
        }
        }
        break;
    case 3:
        switch (func_0202b878(card)) {
        case 0x16:
            if (func_0202b8c0(card) != 5) data_ov002_022d016c.error=5;
            else if (func_ov002_021bd110(player,card)) {
                if (func_ov002_021fd74c(player,slot,card)) result |= 8;
            } else data_ov002_022d016c.error=0xc;
            break;
        case 0x17:
            data_ov002_022d016c.error=0xf;
            if (func_ov002_021fd74c(player,slot,card)) result |= 8;
            break;
        default:
            data_ov002_022d016c.error=6;
            break;
        }
        break;
    }
    if (!func_0202e234(card)) {
        if (func_ov002_021b3ecc(0,11,0x1407)) result &= ~0x88;
    }
    return result;
}



