extern void func_02006148(int *out_a, int *out_b);
extern unsigned int func_0200617c(void);
extern int func_02037208(int a0, int a1, int a2, int a3);
extern unsigned short data_02104bac[];
typedef struct {
    int active, state, f8, hit, f10, height, top, frame;
} State;
#define BG0 (*(volatile unsigned int *)0x04001010)
#define BG1 (*(volatile unsigned int *)0x04001014)
int func_ov017_021b7ba0(State *p) {
    int y = (192 - p->height) / 2 - 8;
    int distance = p->height + (192 - p->height) / 2 - 8;
    unsigned short keys = data_02104bac[42];
    int x, touch_y;
    switch (p->state) {
    case 0:
        p->frame++;
        BG0 = ((p->height - distance * p->frame / 8) << 16) & 0x01ff0000;
        BG1 = ((p->height - distance * p->frame / 8) << 16) & 0x01ff0000;
        if (p->frame >= 8) p->state = 1;
        break;
    case 1:
        if (p->active != 0) {
            if (keys != 0) {
                if (p->active == 1 && (keys & 3)) {
                    p->state = 2;
                    func_02037208(58, -1, 0, 1);
                }
            } else {
                if (p->active == 1) {
                    int top = p->top + y + 5;
                    func_02006148(&x, &touch_y);
                    if (x >= 104 && touch_y >= top && x < 152 && touch_y < top + 18)
                        p->hit = 1;
                    else
                        p->hit = 0;
                    if (func_0200617c() && p->hit) {
                        func_02037208(58, -1, 0, 1);
                        p->state = 2;
                    }
                }
            }
        }
        break;
    case 2:
        p->frame--;
        BG0 = ((p->height - distance * p->frame / 8) << 16) & 0x01ff0000;
        BG1 = ((p->height - distance * p->frame / 8) << 16) & 0x01ff0000;
        if (p->frame <= 0) {
            p->state = 0;
            p->frame = 0;
            return 1;
        }
        break;
    }
    return 0;
}
