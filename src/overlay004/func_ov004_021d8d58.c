extern char data_02104bac[];
typedef struct { int pad; unsigned int mode : 3; unsigned int rest : 29; } Display;
extern Display data_02104f4c;
extern char data_ov004_0220b500[];
extern void func_02006110(int *, int *);
extern unsigned int func_0200617c(void);
extern void *func_020061ac(void);
extern int func_02037208(int, int, int, int);

typedef struct { int state, hover, choice, height, y, timer, mode; } Dialog;
int func_ov004_021d8d58(Dialog *p) {
    int top = (192 - p->height) / 2 - 8;
    int travel = p->height + (192 - p->height) / 2 - 8;
    int width = 56;
    unsigned short keys = *(unsigned short *)(data_02104bac + 0x54);
    int x, y;
    switch (p->state) {
    case 1:
        p->timer++;
        *(volatile unsigned int *)0x04001010 = ((p->height - travel * p->timer / 8) << 16) & 0x01ff0000;
        *(volatile unsigned int *)0x04001014 = ((p->height - travel * p->timer / 8) << 16) & 0x01ff0000;
        if (p->timer >= 8) p->state = 2;
        break;
    case 2:
        if ((p->mode & 15) <= 1) break;
        if (keys) {
            if ((p->mode & 15) == 3) {
                if (keys & 2) {
                    if (*(int *)(data_ov004_0220b500 + 0x44) == 0) func_02037208(67, -1, 0, 1);
                    p->state = 3;
                }
            } else if (keys & 1) {
                if (*(int *)(data_ov004_0220b500 + 0x44) == 0) func_02037208(58, -1, 0, 1);
                p->state = 3;
            } else if ((p->mode & 15) != 2) {
                if (keys & 2) {
                    if (*(int *)(data_ov004_0220b500 + 0x44) == 0) func_02037208(67, -1, 0, 1);
                    p->choice = 1;
                    p->state = 3;
                } else if (keys & 48) {
                    func_02037208(56, -1, 0, 1);
                    p->choice = 1 - p->choice;
                }
            }
        } else if (func_020061ac() || func_0200617c()) {
            int mode = p->mode & 15;
            if ((unsigned int)(mode - 2) <= 1) {
                int left, bottom;
                if (mode == 3) {
                    if (data_02104f4c.mode > 1) width = 76;
                }
                left = 128 - width / 2;
                bottom = p->y + top + 5;
                func_02006110(&x, &y);
                if (x >= left && y >= bottom && x < left + width && y < bottom + 24) {
                    p->hover = 1;
                    p->choice = 0;
                } else p->hover = 0;
            } else {
                int bottom = p->y + top + 5;
                func_02006110(&x, &y);
                if (x >= 48 && y >= bottom && x < 104 && y < bottom + 24) {
                    p->hover = 1;
                    p->choice = 0;
                } else if (x >= 160 && y >= bottom && x < 216 && y < bottom + 24) {
                    p->hover = 1;
                    p->choice = 1;
                } else p->hover = 0;
            }
            if (func_0200617c() && p->hover) {
                if (*(int *)(data_ov004_0220b500 + 0x44) == 0) func_02037208(58, -1, 0, 1);
                p->state = 3;
            }
        } else p->hover = 0;
        break;
    case 3:
        p->timer--;
        *(volatile unsigned int *)0x04001010 = ((p->height - travel * p->timer / 8) << 16) & 0x01ff0000;
        *(volatile unsigned int *)0x04001014 = ((p->height - travel * p->timer / 8) << 16) & 0x01ff0000;
        if (p->timer <= 0) { p->state = 0; return 1; }
        break;
    }
    return 0;
}

