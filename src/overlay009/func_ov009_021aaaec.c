typedef struct { int f0; int f4; short next; short f0a; } Node;
extern Node *func_02005dac(int which, int slot_i);
extern void func_02006110(int *, int *);
extern void *func_020061ac(void);
extern void func_020944a4(int, int, int);
typedef struct { unsigned int attr; unsigned short tile; } Sprite;
int func_ov009_021aaaec(int *o) {
    int x, y;
    Sprite sprite;
    int offset = (192 - o[7]) / 2 - 8;
    int row = o[8] + offset;
    if (o[3] == 1) {
        switch (o[2]) {
        case 0: {
            int top = row + 5;
            int hit = 0;
            int tile;
            func_02006110(&x, &y);
            if (x >= 0x68 && y >= top && x < 0x98 && y < top + 18) hit = 1;
            tile = 0x34;
            if (func_020061ac() != 0 && hit != 0) tile = 0x3c;
            sprite.attr = ((row - 2) & 0xff) | 0xc0614000;
            sprite.tile = tile | 0x2400;
            func_020944a4((int)&sprite, (int)func_02005dac(2, 0), 6);
            break;
        }
        case 1: {
            int i;
            int side = o[6];
            int stride;
            int hit;
            int top = row + 5;
            func_02006110(&x, &y);
            for (i = 0, stride = 0; i < 2; i++) {
                hit = 0;
                int tile;
                int left;
                if (side != 0) {
                    if (x >= 0xa0 && y >= top && x < 0xd0 && y < top + 18) hit = 1;
                    tile = 0x34 - stride;
                    if (func_020061ac() != 0 && hit != 0) tile = 0x3c;
                    left = 0x9c;
                } else {
                    if (x >= 0x30 && y >= top && x < 0x60 && y < top + 18) hit = 1;
                    tile = 0x34 - stride;
                    if (func_020061ac() != 0 && hit != 0) tile = 0x3c;
                    left = 0x2c;
                }
                sprite.attr = ((row - 2) & 0xff) | 0xc0004000 | (((left - 4) & 0x1ff) << 16);
                sprite.tile = tile | 0x2400;
                func_020944a4((int)&sprite, (int)func_02005dac(2, 0), 6);
                side = 1 - side;
                stride += 8;
            }
            break;
        }
        }
    }
    return 1;
}






