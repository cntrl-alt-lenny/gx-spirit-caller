typedef struct {
    int active, state, f8, hit, f10, height, top, frame;
} State;
extern void func_02006110(int *out_a, int *out_b);
extern void *func_020061ac(void);
extern int func_02005dac(int engine, int index);
extern void func_020944a4(int unused0, int unused1, int unused2);
int func_ov017_021b7dac(State *p) {
    struct {
        struct { unsigned int attr01; unsigned short attr2; } sprite;
        int touch_y, x;
    } draw;
    int offset = (192 - p->height) / 2 - 8;
    int y = p->top + offset;
    switch (p->state) {
    case 1:
      if (p->active == 1) {
        int top = y + 5;
        int hit = 0;
        int tile;
        func_02006110(&draw.x, &draw.touch_y);
        if (draw.x >= 104 && draw.touch_y >= top && draw.x < 152 && draw.touch_y < top + 18)
            hit = 1;
        tile = 0x26c;
        if (func_020061ac() && hit) tile = 0x274;
        draw.sprite.attr01 = ((y - 2) & 0xff) | 0xc0614000;
        draw.sprite.attr2 = tile | 0x5400;
        func_020944a4((int)&draw.sprite, func_02005dac(2, 0), 6);
      }
      break;
    }
    return 1;
}
