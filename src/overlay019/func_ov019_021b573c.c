#include <nitro/types.h>
typedef struct {
    int mode, state, unk8, hit, unk10, height, y, step;
} State;
extern unsigned short data_02104bac[];
extern void func_02006148(int *out_a, int *out_b);
extern unsigned int func_0200617c(void);
extern int func_02037208(int a0, int r1, int r2, int r3);
#define BG0 (*(volatile unsigned int *)0x04001010)
#define BG1 (*(volatile unsigned int *)0x04001014)
int func_ov019_021b573c(State *p) {
    int top = (192 - p->height) / 2 - 8;
    int distance = p->height + (192 - p->height) / 2 - 8;
    unsigned short keys = data_02104bac[0x2a];
    int x, y;
    switch (p->state) {
    case 0:
        p->step++;
        BG0 = ((p->height - distance * p->step / 8) << 16) & 0x01ff0000;
        BG1 = ((p->height - distance * p->step / 8) << 16) & 0x01ff0000;
        if (p->step >= 8) p->state = 1;
        break;
    case 1:
        if (p->mode == 0) break;
        if (keys != 0) {
            if (p->mode == 1) {
                if (keys & 3) {
                    p->state = 2;
                    func_02037208(0x3a, -1, 0, 1);
                }
            }
        } else {
            if (p->mode == 1) {
                int buttonY = p->y + top + 5;
                func_02006148(&x, &y);
                if (x >= 0x68 && y >= buttonY && x < 0x98 && y < buttonY + 0x12)
                    p->hit = 1;
                else p->hit = 0;
                if (func_0200617c() != 0 && p->hit != 0) {
                    func_02037208(0x3a, -1, 0, 1);
                    p->state = 2;
                }
            }
        }
        break;
    case 2:
        p->step--;
        BG0 = ((p->height - distance * p->step / 8) << 16) & 0x01ff0000;
        BG1 = ((p->height - distance * p->step / 8) << 16) & 0x01ff0000;
        if (p->step <= 0) {
            p->state = 0;
            p->step = 0;
            return 1;
        }
        break;
    }
    return 0;
}
