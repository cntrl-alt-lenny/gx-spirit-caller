#include <nitro/types.h>
typedef struct {
    int mode, state, unk8, hit, unk10, height, y, step;
} State;
extern void func_02006110(int *out_a, int *out_b);
extern void *func_020061ac(void);
extern void *func_02005dac(int engine, int slot);
extern void func_020944a4(int unused0, int unused1, int unused2);
int func_ov019_021b5948(State *p) {
    int top = (192 - p->height) / 2 - 8;
    int button = p->y + top;
    int x, y;
    int buttonY;
    int inside;
    int tile;
    struct { unsigned int attr; unsigned short tile; } sprite;
    switch (p->state) { case 1:
    if (p->mode == 1) {
        buttonY = button + 5;
        inside = 0;
        func_02006110(&x, &y);
        if (x >= 0x68 && y >= buttonY && x < 0x98 && y < buttonY + 0x12)
            inside = 1;
        tile = 0x338;
        if (func_020061ac() != 0 && inside != 0)
            tile = 0x340;
        sprite.attr = 0xc0614000 | ((button - 2) & 0xff);
        sprite.tile = tile | 0x1400;
        func_020944a4((int)&sprite, (int)func_02005dac(2, 0), 6);
    }
    }
    return 1;
}




