extern void func_02006110(int *out_a, int *out_b);
extern void func_02006148(int *out_a, int *out_b);
extern unsigned int func_0200617c(void);
extern int func_02037208(int a0, int r1, int r2, int r3);
extern unsigned short data_02104bac[];
typedef struct {
    int kind, state, unk8, hover, choice, height, y, timer;
} Dialog;
#define BG0 (*(volatile unsigned int *)0x04001010)
#define BG1 (*(volatile unsigned int *)0x04001014)
int func_ov016_021b5a6c(Dialog *p) {
    int top = (192 - p->height) / 2 - 8;
    int dist = p->height + (192 - p->height) / 2 - 8;
    unsigned short keys = data_02104bac[42];
    int x, y;
    int row;
    switch (p->state) {
    case 0:
        p->timer++;
        BG0 = ((p->height - dist * p->timer / 8) << 16) & 0x01ff0000;
        BG1 = ((p->height - dist * p->timer / 8) << 16) & 0x01ff0000;
        if (p->timer >= 8) p->state = 1;
        break;
    case 1:
        if (p->kind == 0) break;
        if (keys != 0) {
            switch (p->kind) {
            case 1:
                if (keys & 3) {
                    p->state = 2;
                    func_02037208(0x3a, -1, 0, 1);
                }
                break;
            case 2:
                if (keys & 1) {
                    func_02037208(0x3a, -1, 0, 1);
                    p->state = 2;
                } else if (keys & 2) {
                    func_02037208(0x43, -1, 0, 1);
                    p->choice = 1;
                    p->state = 2;
                } else if (keys & 0x30) {
                    func_02037208(0x38, -1, 0, 1);
                    p->choice = 1 - p->choice;
                }
                break;
            }
        } else {
            switch (p->kind) {
            case 1:
                row = p->y + top + 5;
                func_02006148(&x, &y);
                if (x >= 0x68 && y >= row && x < 0x98 && y < row + 18) p->hover = 1;
                else p->hover = 0;
                if (func_0200617c() && p->hover) {
                    func_02037208(0x3a, -1, 0, 1);
                    p->state = 2;
                }
                break;
            case 2:
                row = p->y + top + 5;
                func_02006110(&x, &y);
                if (x >= 0x30 && y >= row && x < 0x60 && y < row + 18) {
                    p->hover = 1;
                    p->choice = 0;
                } else if (x >= 0xa0 && y >= row && x < 0xd0 && y < row + 18) {
                    p->hover = 1;
                    p->choice = 1;
                } else p->hover = 0;
                if (func_0200617c() && p->hover) {
                    func_02037208(0x3a, -1, 0, 1);
                    p->state = 2;
                }
                break;
            }
        }
        break;
    case 2:
        p->timer--;
        BG0 = ((p->height - dist * p->timer / 8) << 16) & 0x01ff0000;
        BG1 = ((p->height - dist * p->timer / 8) << 16) & 0x01ff0000;
        if (p->timer <= 0) {
            p->state = 0;
            p->timer = 0;
            return 1;
        }
        break;
    }
    return 0;
}
