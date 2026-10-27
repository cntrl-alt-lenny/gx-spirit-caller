typedef struct { int f0, f4; short next, f0a; } Node;
extern Node *func_02005dac(int which, int slot_i);
extern void func_02006110(int *out_a, int *out_b);
extern void *func_020061ac(void);
extern void func_020944a4(int unused0, int unused1, int unused2);
typedef struct { int mode, state, f8, fc, selected, height, y; } State;
typedef struct { unsigned int attr; unsigned short tile; } Sprite;
int func_ov016_021b5dd0(State *p) {
    int x, y;
    Sprite sprite;
    int top = p->y + ((192 - p->height) / 2 - 8);
    if (p->state == 1) {
        switch (p->mode) {
        case 1: {
            int low = top + 5;
            int hit = 0;
            int tile;
            func_02006110(&x, &y);
            if (x >= 104 && y >= low && x < 152 && y < low + 18) hit = 1;
            tile = 620;
            if (func_020061ac() && hit) tile = 628;
            sprite.attr = ((top - 2) & 255) | 0xc0614000;
            sprite.tile = tile | 0x400;
            func_020944a4((int)&sprite, (int)func_02005dac(2, 0), 6);
            break;
        }
        case 2: {
            int i;
            int selected = p->selected;
            int step;
            int hit;
            int low = top + 5;
            func_02006110(&x, &y);
            for (i = 0, step = 0; i < 2; i++) {
                hit = 0;
                int tile;
                int pos;
                if (selected) {
                    if (x >= 160 && y >= low && x < 208 && y < low + 18) hit = 1;
                    tile = 620 - step;
                    if (func_020061ac() && hit) tile = 628;
                    pos = 156;
                } else {
                    if (x >= 48 && y >= low && x < 96 && y < low + 18) hit = 1;
                    tile = 620 - step;
                    if (func_020061ac() && hit) tile = 628;
                    pos = 44;
                }
                sprite.attr = ((top - 2) & 255) | 0xc0004000 | ((unsigned int)(pos - 4) << 23 >> 7);
                sprite.tile = tile | 0x400;
                func_020944a4((int)&sprite, (int)func_02005dac(2, 0), 6);
                selected = 1 - selected;
                step += 8;
            }
            break;
        }
        }
    }
    return 1;
}





