typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { u32 id:13; u32 rest:19; } Entry;
typedef struct { int pad; int kind; int pad2; int flags; int pad3[5]; int inhibit; } Card;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a2[];
extern short data_ov002_022bdfec[][24];
extern int func_ov002_021b9ecc(int self, int arg1);
extern int func_0202e5ac(int x);
extern int func_0202ed04(int id);
u32 func_ov002_021c3e40(Card *card, int side, int index, int other, int slot) {
    int id = ((Entry *)(data_ov002_022cf16c + (side & 1) * 0x868 + index * 20 + 0x30))->id;
    int attack = 0;
    int defense = 0;
    if ((card->inhibit & ((other != side) + 1)) > 0) return 0;
    switch (id) {
    case 0x1323:
        if (*(u16 *)(data_ov002_022cf1a2 + (other & 1) * 0x868 + slot * 20) != 0) defense += 500;
        break;
    case 0x10f0: case 0x10f1: case 0x10f2: case 0x10f3: case 0x10f4: case 0x10f5:
        { int kind = card->kind;
          if (kind != 0 && kind <= 20) {
              int value = data_ov002_022bdfec[id - 0x10f0][kind];
              attack += value; defense += value;
          }
        }
        break;
    case 0x183f:
        if (card->kind == 16) { attack += 200; defense += 200; }
        break;
    case 0x1aa7:
        if (card->kind == 9) { attack += 300; defense += 300; }
        break;
    case 0x1344:
        if (card->flags & 0x20) { attack += 500; defense -= 400; }
        break;
    case 0x1345:
        if (card->flags & 8) { attack += 500; defense -= 400; }
        break;
    case 0x1346:
        if (card->flags & 0x10) { attack += 500; defense -= 400; }
        break;
    case 0x1347:
        if (card->flags & 0x40) { attack += 500; defense -= 400; }
        break;
    case 0x1348:
        if (card->flags & 2) { attack += 500; defense -= 400; }
        break;
    case 0x1349:
        if (card->flags & 4) { attack += 500; defense -= 400; }
        break;
    case 0x150b:
        if (card->flags & 8) { attack += 200; defense += 200; }
        break;
    case 0x159d:
        if (func_0202e5ac(func_ov002_021b9ecc(other, slot)) != 0) { attack += 500; defense += 500; }
        break;
    case 0x1a77:
        if (func_ov002_021b9ecc(other, slot) == 0x19fd || func_0202ed04(((Entry *)(data_ov002_022cf16c + (other & 1) * 0x868 + slot * 20 + 0x30))->id) != 0) attack += 500;
        break;
    }
    return (u16)attack | ((u16)defense << 16);
}
