extern int data_021040ac[];
extern int data_ov002_022d016c[];
extern unsigned int data_02104f4c[];
extern unsigned short data_0210594c[];
extern int data_ov002_022d0f2c[];
extern unsigned int func_02011780(int i);
extern int func_02034784(void);
extern int func_ov002_022b03f4(int v);
extern int func_ov002_022b13ec(int arg);

typedef struct { int pad0[2]; unsigned int count; int pad1[6]; int n; int pad2[12]; int amount; int pad3[14]; unsigned short cards[1]; } State;
int func_ov002_022b18a0(State *p, int kind)
{
    int value;
    int sum;
    int i;
    switch (kind) {
    case 1:
        if (data_021040ac[0x2eb] >= 0 && func_02034784() != 0)
            return 0;
        if (data_ov002_022d016c[0x340] == 1 && data_ov002_022d016c[0x341] != 3) {
            value = func_02011780(data_021040ac[0x2e9]);
            if (((data_02104f4c[0x299] & 0x1f00000) >> 20) == 4)
                return value * (data_0210594c[0x4c] * 4 + 102) / 100;
            return value;
        }
        return 0;
    case 11:
        if (data_ov002_022d016c[0x340] == 1 && data_ov002_022d016c[0x341] != 3)
            return func_02011780(data_021040ac[0x2e9]);
        return 0;
    case 2:
        if (data_021040ac[0x2eb] >= 0 && func_02034784() != 0)
            return 0;
        if (data_ov002_022d0f2c[0x33] == 0)
            return 0;
        if (data_ov002_022d016c[0x340] == 1 && data_ov002_022d016c[0x341] != 3) {
            value = func_02011780(data_021040ac[0x2e9]);
            return value / 10;
        }
        return 0;
    case 3:
        return 0;
    case 4:
        if (data_ov002_022d016c[0x341] != 3)
            return 0;
        return data_021040ac[0x2e9] * 150;
    case 6:
        if (data_ov002_022d016c[0x340] != 3)
            return 0;
        value = func_02011780(data_021040ac[0x2e9]);
        return value / 2;
    case 10: {
        unsigned int j;
        int total;
        total = 0;
        for (j = 0; j < p->count; j++) {
            if (func_02034784() == 2 && data_021040ac[0x2eb] < 0)
                value = data_0210594c[0x2c];
            else
                value = data_0210594c[0x29];
            total += value - j;
        }
        return total * 100;
    }
    case 116:
        sum = 0;
        for (i = 0; i < p->n; i++) {
            if (func_ov002_022b03f4(p->cards[i] - 4))
                sum++;
        }
        return sum * 50;
    case 117:
        if (((data_02104f4c[0x299] & 0x1f00000) >> 20) != 1)
            return p->amount;
        return p->amount * (data_0210594c[0x40] * 4 + 102) / 100;
    default:
        return func_ov002_022b13ec(kind - 4);
    }
}


