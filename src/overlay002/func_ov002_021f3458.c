typedef struct {
    unsigned short id;
    unsigned short side:1;
    unsigned short unused:5;
    unsigned short kind:6;
    unsigned short state:2;
    unsigned short owner:1;
    unsigned short pad:1;
    unsigned short u0:6;
    unsigned short index:9;
    unsigned short u1:1;
} Card;
extern unsigned int func_0202b878(int id);
extern int func_ov002_021bae7c(int player, int id, int except);
/* The assembly thunk tail-calls an int-returning function with two arguments. */
extern int func_ov002_021b4254(int index, int id);
extern char data_ov002_022cf16c[];
int func_ov002_021f3458(Card *card)
{
    int side = card->side ^ card->owner;
    int result = 0;
    if (func_0202b878(card->id) == 0x16 && card->state == 0) {
        if (func_ov002_021bae7c(side, 0x17a3, -1) != 0)
            return 0;
    }
    if (card->kind == 0x23) return 0;
    switch (card->id) {
    case 0x14be:
        result = 100;
        break;
    case 0x16a4:
    case 0x1741:
    case 0x1775:
    case 0x17c9:
    case 0x184d:
    case 0x18cc:
    case 0x1977:
    case 0x19e1:
    case 0x19e2:
    case 0x1af6:
    case 0x1b57:
        result = 500;
        break;
    case 0x1295:
    case 0x12c3:
    case 0x1366:
    case 0x1684:
    case 0x17a7:
    case 0x1880:
    case 0x1881:
        result = 800;
        break;
    case 0x1138:
    case 0x12be:
    case 0x12ff:
    case 0x1324:
    case 0x1325:
    case 0x1393:
    case 0x14b6:
    case 0x14c7:
    case 0x14f0:
    case 0x159f:
    case 0x15b5:
    case 0x15ff:
    case 0x1619:
    case 0x166c:
    case 0x16e4:
    case 0x1766:
    case 0x17f4:
    case 0x18ec:
    case 0x1922:
    case 0x1932:
    case 0x1935:
    case 0x1975:
    case 0x1af4:
    case 0x1af5:
        result = 1000;
        break;
    case 0x14ab:
    case 0x15e6:
    case 0x162b:
        result = 1500;
        break;
    case 0x13a7:
    case 0x156a:
    case 0x169c:
    case 0x1712:
    case 0x19d5:
        result = 2000;
        break;
    case 0x114a:
        result = 5000;
        break;
    case 0x12de:
    case 0x12fd:
    case 0x1679:
    case 0x17bc:
    case 0x17be:
    case 0x1b05:
        result = *(int *)(data_ov002_022cf16c + (side & 1) * 0x868) >> 1;
        break;
    case 0x11cf:
        if (card->kind != 2) result = 500;
        break;
    case 0x143e:
    case 0x1628:
        if (card->state != 0) result = 100;
        break;
    case 0x1599:
    case 0x16d5:
    case 0x18d2:
        if (card->state != 0) result = 300;
        break;
    case 0x10df:
    case 0x10e7:
    case 0x12f3:
    case 0x1367:
    case 0x14c2:
    case 0x169d:
        if (card->state != 0) result = 500;
        break;
    case 0x1517:
        if (card->state != 0) result = 800;
        break;
    case 0x175d:
        if (card->state != 0) result = 700;
        break;
    case 0x13c7:
        if (card->kind == 0x16) result = 1000;
        break;
    case 0x188f:
        if (card->kind == 0x16) result = 500;
        break;
    case 0x1445:
        if (card->state == 0 && func_ov002_021b4254(card->index, card->id) < 3) result = *(int *)(data_ov002_022cf16c + (side & 1) * 0x868) >> 1;
        break;
    case 0x11a0:
        result = 3000;
        break;
    }
    return result;
}


