typedef unsigned int u32;
typedef unsigned char u8;
struct State { char pad[0x5d4]; u32 count; char gap[4]; u8 rules[34]; };
struct Duel { char pad[0xcec]; int side; };
extern struct State data_ov002_022ce288;
extern struct Duel data_ov002_022d016c;
extern int data_ov002_022cd744[];
extern int func_0202e234(int x);
extern int func_02031470(int x);

int func_ov002_022451b8(int side, int card) {
    u32 i;
    for (i = 0; i < data_ov002_022ce288.count; i++) {
        switch (data_ov002_022ce288.rules[i]) {
        case 1:
            return data_ov002_022cd744[side] == 1;
        case 2:
            switch (card) {
            case 0x131e:
            case 0x15ad:
            case 0x15f0:
            case 0x1a9d:
                return 1;
            }
            break;
        case 3:
            switch (card) {
            case 0x1358:
            case 0x1472:
            case 0x14d4:
            case 0x17fc:
            case 0x1886:
            case 0x1aca:
                return 1;
            }
            break;
        case 4:
            switch (card) {
            case 0x1472:
            case 0x1aca:
                return 1;
            }
            break;
        case 6:
            switch (card) {
            case 0x124f:
            case 0x1250:
            case 0x12cd:
            case 0x12e4:
            case 0x13fa:
            case 0x1518:
            case 0x1572:
            case 0x15c6:
            case 0x15f3:
            case 0x15f8:
            case 0x16e0:
                return 1;
            }
            if (func_0202e234(card) != 0 && func_02031470(card) == 0) return 1;
            break;
        case 7:
            switch (card) {
            case 0x124f:
            case 0x1250:
            case 0x12cd:
            case 0x12e4:
            case 0x13fa:
            case 0x1518:
            case 0x1572:
            case 0x15c6:
            case 0x15f8:
            case 0x16e0:
                return 1;
            }
            if (func_0202e234(card) != 0) return 1;
            break;
        case 8:
            switch (card) {
            case 0x12cd:
            case 0x13fa:
            case 0x140f:
            case 0x1518:
            case 0x15f8:
            case 0x16e0:
            case 0x18d8:
            case 0x18dc:
            case 0x192e:
            case 0x195d:
            case 0x198e:
            case 0x1aa1:
                return 1;
            }
            if (func_0202e234(card) != 0) return 1;
            break;
        case 11:
            switch (card) {
            case 0x12d7:
                return 1;
            }
            break;
        case 9:
            switch (card) {
            case 0x140f:
            case 0x192e:
                return 1;
            }
            break;
        case 16:
            switch (card) {
            case 0x1352:
            case 0x135a:
                return 1;
            }
            break;
        case 18:
        case 19:
            return 1;
        case 24:
            switch (card) {
            case 0x134e:
                return 1;
            }
            break;
        case 25:
            switch (card) {
            case 0x1353:
            case 0x151c:
                return 1;
            }
            break;
        case 27:
            switch (card) {
            case 0x134b:
            case 0x134c:
            case 0x134d:
            case 0x135b:
            case 0x15b5:
            case 0x195e:
            case 0x1a16:
            case 0x1a6b:
            case 0x1aa9:
                return 1;
            }
            break;
        case 29:
            switch (card) {
            case 0x1354:
                return 1;
            }
            break;
        case 5:
            if (data_ov002_022cd744[side] == 1) return 1;
            switch (card) { case 0x1aa8: case 0x1b22: return 1; }
            return side != data_ov002_022d016c.side;
        case 23:
            if (side != data_ov002_022d016c.side && card == 0x12f3) return 1;
            break;
        case 31:
        case 32:
        case 33:
            return 1;
        case 13:
        case 14:
        case 15:
        case 20:
        case 21:
        case 22:
            return 1;
        }
    }
    return 0;
}
