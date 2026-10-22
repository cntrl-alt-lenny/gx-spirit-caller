extern int data_021040ac[];
extern int data_ov002_022d016c[];
extern int data_ov002_022cd73c[];
extern int data_02104c68[];
extern int data_ov002_022d0f2c[];
struct Player { int life; char pad[0x864]; };
extern struct Player data_ov002_022cf16c[];
int func_ov002_02299d34(void)
{
    int base = 8;
    int result = 13;
    int opponent, adjustment, player, difference;
    int state = data_021040ac[738];
    if (state == 2 || data_ov002_022d016c[829] != 0xffff)
        return 12;
    if (state == 3) return 27;
    player = data_ov002_022cd73c[1];
    opponent = player ^ 1;
    switch (data_02104c68[opponent]) {
    case 0:
        result = data_021040ac[782] & 7; if (result > 5) result += 7; break;
    case 1:     case 2:     case 3:     case 69:     case 70:     case 75:
        result = 2; break;
    case 4:     case 8:     case 9:     case 20:     case 23:
        result = 13; break;
    case 5:     case 7:     case 10:     case 11:     case 12:     case 16:     case 17:     case 18:     case 21:     case 22:     case 62:     case 65:     case 66:     case 71:
        result = 0; break;
    case 6:     case 13:     case 14:     case 15:     case 19:     case 67:     case 68:     case 74:
        result = 1; break;
    case 24:     case 25:     case 26:     case 27:     case 28:     case 29:
        result = 14; break;
    case 30:     case 31:     case 32:     case 33:     case 34:     case 35:     case 36:     case 37:     case 38:     case 39:     case 40:     case 41:     case 42:     case 43:     case 44:     case 45:     case 46:     case 73:     case 94:
        result = 4; break;
    case 47:     case 49:     case 50:     case 51:     case 72:     case 76:     case 77:     case 78:     case 79:     case 80:     case 81:     case 82:     case 83:     case 84:     case 85:     case 86:     case 87:     case 88:     case 89:     case 90:     case 91:     case 92:     case 93:
        result = 3; base = 10; break;
    case 52:     case 53:     case 54:     case 55:     case 56:     case 57:     case 58:     case 59:     case 60:
        result = 5; base = 10; break;
    case 48:     case 63:     case 64:
        result = 6; base = 10; break;
    case 61:     case 95:
        result = 7; base = 10; break;
    }
    adjustment = 0;
    switch (data_ov002_022d0f2c[54]) {
    case 8: case 10: adjustment = 1; break;
    case 9: case 11: adjustment = -1; break;
    }
    difference = data_ov002_022cf16c[opponent & 1].life - data_ov002_022cf16c[player & 1].life;
    if (difference >= 3000 || (difference >= 1000 && adjustment < 0))
        return base + 1;
    if (difference > -3000) {
        if (difference > -1000 || adjustment <= 0) return result;
    }
    return base;
}




