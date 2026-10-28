typedef int s32;
typedef unsigned int u32;
typedef struct { unsigned short id:13; unsigned short rest:3; unsigned short pad; } Card;
extern Card data_ov002_022d0250[];
extern int data_ov002_022cd73c[];
typedef struct { char pad[0xcec]; int player; char pad2[8]; int phase; char pad3[0x84]; int error; } State;
extern State data_ov002_022d016c;
extern char data_ov002_022cf178[];
extern char data_ov002_022cf16c[];
extern int func_0202e234(int x);
extern s32 func_ov002_021b98c4(s32 side, s32 id);
extern s32 func_ov002_021b9aa8(u32 a, u32 b);
extern int func_ov002_021bb068(int id);
/* Original initializes only r0 and r1 for this four-argument thunk. */
extern int func_ov002_021bb90c();
extern int func_ov002_021bb91c(int arg0);
extern int func_ov002_021bb950(int self, int arg2);
extern int func_ov002_021bbe8c(int arg);
extern int func_ov002_021bbf50(int arg0);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021bcd80(int self, int excludeKey);
extern int func_ov002_021bd85c(int a, int b);
extern int func_ov002_021c38c4(int side, int index);
extern int func_ov002_021c9be8(int arg0, int arg1);
/* Original initializes only r0 for this four-argument thunk. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern int func_ov002_0226d6f4(int arg0, int arg1);
extern int func_ov002_0226d784(int a, int b);
extern int func_ov002_0226d864(int a, int b);
extern int func_ov002_0226d95c(int player, int arg1);
extern int func_ov002_0226d9e4(int player, int id);
extern int func_ov002_0226daec(int player, int arg1);
extern int func_ov002_0226db7c(void *arg0, int arg1);
extern int func_ov002_0226dbb0(int player);
extern int func_ov002_0226dd10(int player);
extern int func_ov002_0226de80(int arg0);
extern int func_ov002_0226df10(int player, int arg1);
extern int func_ov002_0226df90(int arg0);
extern int func_ov002_0226e038(int player);
extern int func_ov002_0226e0ec(int player, int id);
extern int func_ov002_0226e580(int player, int card);
extern int func_ov002_0226e6e0(int player, int card);
extern int func_ov002_0226ead0(int player, int arg1);
int func_ov002_0226f4dc(int player, int index) {
    int card = data_ov002_022d0250[index].id;
    int flags = 0;
    if (card == 0) return flags;
    if (func_0202e234(card) == 0) return flags;
    if (func_ov002_021bd85c(card, -1) != 0) {
        if (player == data_ov002_022cd73c[1]) data_ov002_022d016c.error = 0x10;
        return 0;
    }
    if (func_ov002_021ca2b8(player) == 0) {
        if (player == data_ov002_022cd73c[1]) data_ov002_022d016c.error = 0x11;
        return 0;
    }
    if (func_ov002_021ca3f0(player, card) == 0) return flags;
    switch (card) {
    case 0x112e:
    case 0x128c:
    case 0x15b1:
    case 0x15b4:
    case 0x15f9:
    case 0x15fa:
    case 0x1953:
    case 0x1954:
    case 0x1a6d:
    case 0x1a6e:
    case 0x1a6f:
    case 0x1b4c:
    case 0x1b4d:
    case 0x1b4e:
        if (data_ov002_022d016c.phase != 2 && data_ov002_022d016c.phase != 4) return 0;
        if (data_ov002_022d016c.player != player) return 0;
        break;
    case 0x196b:
    case 0x196c:
    case 0x196d:
    case 0x196e:
        if (func_ov002_021b9aa8(player, index) < 0) {
            if (data_ov002_022d016c.phase != 2 && data_ov002_022d016c.phase != 4) return 0;
            if (data_ov002_022d016c.player != player) return 0;
            break;
        }
    default:
        if (func_ov002_021c9be8(player, card) == 0) {
            if (player == data_ov002_022cd73c[1]) data_ov002_022d016c.error = 0x17;
            return 0;
        }
        break;
    }
    switch (card) {
    case 0x1488:
        if (func_ov002_021bc618(player)) flags |= 4;
        break;
    case 0x1299:
        if (func_ov002_021bc618(player) && func_ov002_021bbf50(player) + 1 < func_ov002_021bbf50(1 - player)) flags |= 4;
        break;
    case 0x164c:
        if (func_ov002_021bc618(player) && *(unsigned int *)(data_ov002_022cf178 + (player & 1) * 0x868) <= 1 && func_ov002_021bb90c(player, 0x165e)) flags |= 4;
        break;
    case 0x17c7:
    case 0x17c8:
        if (func_ov002_021bc618(player) && func_ov002_021bb91c(0x17bf) && *(int *)(data_ov002_022cf16c + (player & 1) * 0x868) > func_ov002_021bb068(0x132c) * 500 + 500) flags |= 4;
        break;
    case 0x1806:
        if (func_ov002_021bc618(player) && *(unsigned int *)(data_ov002_022cf178 + (player & 1) * 0x868) > 1) flags |= 4;
        break;
    case 0x18f6:
        if (func_ov002_021bc618(player) && func_ov002_021bbf50(player) == 0 && func_ov002_021bbf50(1-player) != 0) flags |= 4;
        break;
    case 0x18f9:
        if (func_ov002_021bc618(player) && *(unsigned int *)(data_ov002_022cf178 + (player & 1) * 0x868) == 1) flags |= 4;
        break;
    case 0x196b:
    case 0x196c:
    case 0x196d:
    case 0x196e:
        if (func_ov002_0226df10(player, card)) flags |= 4;
        break;
    case 0x19aa:
        if (func_ov002_021bc618(player) && func_ov002_021bb950(player, card)) flags |= 4;
        break;
    case 0x1a92:
        if (func_ov002_0226e038(player)) flags |= 4;
        break;
    case 0xfde:
    case 0xfdf:
    case 0xfe9:
        if (func_ov002_0226d6f4(player, card)) flags |= 4;
        break;
    case 0x112e:
    case 0x128c:
        if (func_ov002_021b98c4(player, index) >= 0 && func_ov002_0226d784(player, card)) flags |= 4;
        break;
    case 0x111c:
        if (func_ov002_0226dbb0(player)) flags |= 4;
        break;
    case 0x138a:
        if (func_ov002_0226dd10(player)) flags |= 4;
        break;
    case 0x1466:
    case 0x1483:
    case 0x1484:
    case 0x1485:
    case 0x1486:
    case 0x1487:
    case 0x16c5:
    case 0x16c6:
    case 0x16c7:
    case 0x16c8:
    case 0x18b4:
    case 0x19ca:
        if (func_ov002_0226e580(player, (unsigned short)card)) flags |= 4;
        break;
    case 0x16c9:
    case 0x16cb:
    case 0x16e4:
        if (func_ov002_0226e6e0(player, card)) flags |= 4;
        break;
    case 0x13e9:
        if (func_ov002_0226de80(player)) flags |= 4;
        break;
    case 0x14fc:
        if (func_ov002_021bc618(player) && func_ov002_021bb90c(player, 0x1414)) flags |= 4;
        break;
    case 0x1578:
        if (func_ov002_0226df90(player)) flags |= 4;
        break;
    case 0x19a3:
    case 0x19a4:
    case 0x19c8:
        if (func_ov002_0226d9e4(player, card)) flags |= 4;
        break;
    case 0x19a6:
        if (func_ov002_0226db7c(player, card)) flags |= 4;
        break;
    case 0x1758:
    case 0x176c:
    case 0x17c2:
    case 0x1894:
    case 0x18b9:
    case 0x18e8:
    case 0x1982:
    case 0x198c:
    case 0x19f0:
    case 0x19f7:
    case 0x19f8:
        if (func_ov002_0226d784(player, card)) flags |= 4;
        break;
    case 0x17c6:
    case 0x19a5:
        if (func_ov002_0226d864(player, card)) flags |= 4;
        break;
    case 0x1a65:
        if (func_ov002_0226d95c(player, card)) flags |= 4;
        break;
    case 0x1895:
        if (func_ov002_0226daec(player, card)) flags |= 4;
        break;
    case 0x15b1:
    case 0x15b4:
    case 0x15f9:
    case 0x15fa:
    case 0x1953:
    case 0x1954:
    case 0x1a6d:
    case 0x1a6e:
    case 0x1a6f:
    case 0x1b4c:
    case 0x1b4d:
    case 0x1b4e:
        if (func_ov002_0226e0ec(player, card)) flags |= 4;
        break;
    case 0x127d:
    case 0x127e:
    case 0x127f:
    case 0x12a5:
    case 0x154a:
        if (func_ov002_021bbe8c(player) == 0) return 0;
        switch (func_ov002_021c38c4(player, index)) {
        case 0: case 1: case 2: case 3: case 4:
            if (func_ov002_021bc618(player) == 0) {
                if (player == data_ov002_022cd73c[1]) data_ov002_022d016c.error = 0xb;
            } else flags |= 4;
            break;
        case 5: case 6:
            if (func_ov002_021bcd80(player, -1) < 1) {
                if (player == data_ov002_022cd73c[1]) data_ov002_022d016c.error = 0;
            } else if (func_ov002_0226ead0(player, 1) == 0) {
                if (player == data_ov002_022cd73c[1]) data_ov002_022d016c.error = 0xb;
            } else flags |= 4;
            break;
        default:
            if (func_ov002_021bcd80(player, -1) < 2) {
                if (player == data_ov002_022cd73c[1]) data_ov002_022d016c.error = 0;
            } else if (func_ov002_0226ead0(player, 1) == 0) {
                if (player == data_ov002_022cd73c[1]) data_ov002_022d016c.error = 0xb;
            } else flags |= 4;
            break;
        }
        break;
    }
    return flags;
}
