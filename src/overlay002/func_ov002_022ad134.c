typedef struct { char _pad[0x68]; int *f_68; } state_ov002_022ac028_t;
typedef struct {
    int f0, mode; unsigned int bits, mask; int f10, kind, pad18[2], index, pad24[10], value;
} Self;
struct Obj { int f0, f4, kind, fc, f10, f14, state, value; };
typedef struct {
    int f0, mode, f8, fc, f10, choice, f18, cancel, index;
    char pad24[0x3c];
    int cursor, sort;
    char pad68[0x130];
    struct Obj buttons[3];
} Menu;
extern struct { char pad[0x54]; unsigned short pressed, repeat; } data_02104bac;
extern char data_ov002_022d1a9c[];
extern struct { char pad[0xd0]; int state; } data_ov002_022d0f2c;
extern int func_02037208(int a0, int r1, int r2, int r3);
extern int func_ov002_021afaf0(void);
extern void *func_ov002_021afbc4(void);
extern void func_ov002_0229f1e0(struct Obj *obj);
extern int func_ov002_022a0f8c(Self *self, int i);
extern void func_ov002_022a10fc(Menu *self, int i);
extern int func_ov002_022ac028(state_ov002_022ac028_t *p, int idx);
extern void func_ov002_022ac9ec(Menu *self, int i);
extern void func_ov002_022aeb60(void *self);
void func_ov002_022ad134(Menu *p) {
    if (data_02104bac.pressed & 1) {
        switch (p->cursor) {
        case 0:
            if (func_ov002_021afaf0() > 1 || p->mode == -72) {
                p->choice = 1;
                if (func_ov002_022a0f8c((Self *)p, p->index))
                    func_ov002_0229f1e0(&p->buttons[p->choice]);
            } else if (-p->mode > 5) {
                func_ov002_0229f1e0(&p->buttons[p->choice]);
            }
            break;
        case 1:
            if (p->choice >= 0 && func_ov002_022a0f8c((Self *)p, p->index))
                func_ov002_0229f1e0(&p->buttons[p->choice]);
            break;
        default:
            func_ov002_022ac9ec(p, p->cursor - 2);
            p->cursor = 0;
            func_02037208(0x3a, -1, 0, 1);
            break;
        }
    } else if (data_02104bac.pressed & 2) {
        if (p->cancel >= 0) {
            int i = p->cancel;
            p->choice = i;
            func_ov002_0229f1e0(&p->buttons[i]);
        }
        if (func_ov002_021afaf0() > 1 || p->mode == -72) {
            p->choice = 2;
            if (func_ov002_022a0f8c((Self *)p, p->index))
                func_ov002_0229f1e0(&p->buttons[p->choice]);
        }
    } else if (data_02104bac.pressed & 0x400) {
        func_ov002_022aeb60(data_ov002_022d1a9c);
        data_ov002_022d0f2c.state = 2;
    } else if (data_02104bac.pressed & 4) {
        func_ov002_022ac9ec(p, (p->sort + 1) % 8);
        func_02037208(0x3a, -1, 0, 1);
    } else if (data_02104bac.repeat & 0x20) {
        switch (p->cursor) {
        case 0:
            if (--p->index < 0) p->index = (int)func_ov002_021afbc4() - 1;
            func_ov002_022a10fc(p, p->index);
            func_02037208(0x38, -1, 0, 3);
            break;
        case 1:
            if (func_ov002_021afaf0() > 1 || p->mode == -72) {
                p->choice = !p->choice;
                if (p->choice == 1) {
                    if (func_ov002_022ac028((state_ov002_022ac028_t *)p, p->index) > 0) p->choice = 2;
                }
                func_02037208(0x38, -1, 0, 3);
            }
            break;
        default:
            if (--p->cursor < 2) p->cursor = 9;
            func_02037208(0x38, -1, 0, 3);
            break;
        }
    } else if (data_02104bac.repeat & 0x10) {
        switch (p->cursor) {
        case 0:
            { int count = (int)func_ov002_021afbc4();
            if (++p->index >= count) p->index = 0; }
            func_ov002_022a10fc(p, p->index);
            func_02037208(0x38, -1, 0, 3);
            break;
        case 1:
            if (func_ov002_021afaf0() > 1 || p->mode == -72) {
                p->choice = !p->choice;
                if (p->choice == 1) {
                    if (func_ov002_022ac028((state_ov002_022ac028_t *)p, p->index) > 0) p->choice = 2;
                }
                func_02037208(0x38, -1, 0, 3);
            }
            break;
        default:
            if (++p->cursor > 9) p->cursor = 2;
            func_02037208(0x38, -1, 0, 3);
            break;
        }
    } else if (data_02104bac.repeat & 0x40) {
        switch (p->cursor) {
        case 0:
            p->cursor = 2;
            func_02037208(0x38, -1, 0, 3);
            break;
        case 1:
            p->cursor = 0;
            func_02037208(0x38, -1, 0, 3);
            break;
        }
    } else if (data_02104bac.repeat & 0x80) {
        switch (p->cursor) {
        case 0:
            p->cursor = 1;
            if (func_ov002_021afaf0() > 1 || p->mode == -72) {
                p->choice = (func_ov002_022ac028((state_ov002_022ac028_t *)p, p->index) > 0) + 1;
            }
            func_02037208(0x38, -1, 0, 3);
            break;
        case 1:
            break;
        default:
            p->cursor = 0;
            func_02037208(0x38, -1, 0, 3);
            break;
        }
    }
}

