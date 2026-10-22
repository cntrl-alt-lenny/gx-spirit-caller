extern void func_02006110(int *, int *);
extern void func_02006148(int *, int *);
extern unsigned int func_0200617c(void);
extern void func_02009758(int);
extern void func_0202ba94(int, int);
extern int func_0202bc10(int, int);
extern int func_02037208(int, int, int, int);
extern int func_ov009_021aa4a8(int *, int);
extern int func_ov009_021ab838(void *);
extern char data_02104bac[];
typedef struct { char pad[0xa60]; int balance; } SaveData;
extern SaveData data_02104f4c;
extern char data_ov009_021adc00[];
extern int data_ov009_021adc54;
/* Both counters are reloaded after their stores in the original. */
typedef struct { unsigned short value; } Counter;
extern char data_021067ac[];
extern char data_021067aa[];
int func_ov009_021aa5d8(int *o) {
    int x, y;
    int top = (192 - o[7]) / 2 - 8;
    int distance = o[7] + (192 - o[7]) / 2 - 8;
    unsigned short keys = *(unsigned short *)(data_02104bac + 0x54);
    switch (o[3]) {
    case 0:
        o[9]++;
        *(volatile unsigned int *)0x04001010 = ((o[7] - distance * o[9] / 8) << 16) & 0x01ff0000;
        *(volatile unsigned int *)0x04001014 = ((o[7] - distance * o[9] / 8) << 16) & 0x01ff0000;
        if (o[9] >= 8) o[3] = 1;
        break;
    case 1:
        if (keys != 0) {
            switch (o[2]) {
            case 0:
                if (keys & 3) {
                    o[0] = 0;
                    o[3] = 2;
                    func_02037208(0x3a, -1, 0, 1);
                }
                break;
            case 1:
                if (keys & 1) {
                    func_02037208(0x3a, -1, 0, 1);
                    o[0] = 1 - o[6];
                    o[3] = 2;
                    if (o[0] != 0) {
                        data_02104f4c.balance -= data_ov009_021adc54;
                        func_0202ba94(func_ov009_021ab838(data_ov009_021adc00), 1);
                        func_0202bc10(func_ov009_021ab838(data_ov009_021adc00), 1);
                        { unsigned short *counter = (unsigned short *)data_021067ac; unsigned short count = *counter + 1; *counter = count; }
                        if ((*(unsigned short *)data_021067ac) >= 10) func_02009758(2);
                        { unsigned short *counter = (unsigned short *)data_021067aa; unsigned short count = *counter + data_ov009_021adc54; *counter = count; }
                        if ((*(unsigned short *)data_021067aa) >= 10000) func_02009758(3);
                    }
                } else if (keys & 2) {
                    func_02037208(0x43, -1, 0, 1);
                    o[6] = 1;
                    o[0] = 1 - o[6];
                    o[3] = 2;
                } else if (keys & 0x30) {
                    func_02037208(0x38, -1, 0, 1);
                    o[6] = 1 - o[6];
                }
                break;
            }
        } else {
            switch (o[2]) {
            case 0: {
                int row = o[8] + top + 5;
                func_02006148(&x, &y);
                if (x >= 0x68 && y >= row && x < 0x98 && y < row + 18)
                    o[5] = 1;
                else o[5] = 0;
                if (func_0200617c() != 0 && o[5] != 0) {
                    func_02037208(0x3a, -1, 0, 1);
                    o[0] = 0;
                    o[3] = 2;
                }
                break;
            }
            case 1: {
                int row = o[8] + top + 5;
                func_02006110(&x, &y);
                if (x >= 0x30 && y >= row && x < 0x60 && y < row + 18) {
                    o[5] = 1;
                    o[6] = 0;
                } else if (x >= 0xa0 && y >= row && x < 0xd0 && y < row + 18) {
                    o[5] = 1;
                    o[6] = 1;
                } else o[5] = 0;
                if (func_0200617c() != 0 && o[5] != 0) {
                    func_02037208(0x3a, -1, 0, 1);
                    o[0] = 1 - o[6];
                    o[3] = 2;
                    if (o[0] != 0) {
                        data_02104f4c.balance -= data_ov009_021adc54;
                        func_0202ba94(func_ov009_021ab838(data_ov009_021adc00), 1);
                        func_0202bc10(func_ov009_021ab838(data_ov009_021adc00), 1);
                        { unsigned short *counter = (unsigned short *)data_021067ac; unsigned short count = *counter + 1; *counter = count; }
                        if ((*(unsigned short *)data_021067ac) >= 10) func_02009758(2);
                        { unsigned short *counter = (unsigned short *)data_021067aa; unsigned short count = *counter + data_ov009_021adc54; *counter = count; }
                        if ((*(unsigned short *)data_021067aa) >= 10000) func_02009758(3);
                    }
                }
                break;
            }
            case 2:
                if (o[1] != 0) o[3] = 2;
                break;
            }
        }
        break;
    case 2:
        o[9]--;
        *(volatile unsigned int *)0x04001010 = ((o[7] - distance * o[9] / 8) << 16) & 0x01ff0000;
        *(volatile unsigned int *)0x04001014 = ((o[7] - distance * o[9] / 8) << 16) & 0x01ff0000;
        if (o[9] <= 0) {
            if (o[2] == 1 && o[0] == 1) {
                func_ov009_021aa4a8(o, 3);
                return 0;
            }
            o[3] = 0;
            o[9] = 0;
            return 1;
        }
        break;
    }
    return 0;
}







