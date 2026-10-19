struct Self { unsigned short id; unsigned short side:1; };
extern char data_ov002_022ce288[];
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021afba0(void);
extern int func_ov002_021d7d0c(struct Self *, int, int *);
extern int func_ov002_021d8288();
extern int func_ov002_021e286c(int);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern void func_ov002_0226b054(int);
int func_ov002_0222812c(struct Self *self) {
    switch (*(int *)(data_ov002_022ce288 + 0x5a8)) {
    case 128:
        if (func_ov002_0225368c(self->side, self->id, 0) == 0) {
            func_ov002_021ae400(self->side, 0x15);
            return 120;
        } else {
            func_ov002_021ae400(self->side, 0x37);
            return 126;
        }
    case 126:
        func_ov002_021af9d0(self->side, 6, self->id, 0);
        return 125;
    case 125:
        switch (func_ov002_021afba0()) {
        case 13: func_ov002_021d8288(self->side, func_ov002_021afb74()); break;
        case 14: func_ov002_021d7d0c(self, self->side, func_ov002_021afb74()); break;
        }
        return 100;
    case 120:
        func_ov002_0226b054(1 - self->side);
        return 100;
    case 100:
        func_ov002_021e286c(self->side);
        return 0;
    }
    return 0;
}

