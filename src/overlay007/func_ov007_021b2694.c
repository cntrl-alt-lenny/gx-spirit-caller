typedef struct {
    char pad[0x3c];
    int f3c, f40, f44, f48, f4c;
} Ctx_021b299c;
typedef struct { char pad[0x52]; unsigned short held, pressed, pad56, repeat; } Input;
typedef struct { short id; char pad[0x16]; } Entry;
extern Input data_02104bac;
extern Entry data_020c9694[];
extern char data_ov007_0223352c[];
extern int func_0202224c(int idx);
extern int func_02022234(unsigned int idx, unsigned int v);
extern int func_02037208(int a0, int r1, int r2, int r3);
extern int func_ov007_021b299c(Ctx_021b299c *self);
extern int func_ov007_021b2b74(char *a0, int a1);
/* The original caller supplies two arguments; the callee forwards r1. */
extern int func_ov007_021b2c44(char *a0, int a1);
extern int func_ov007_021b2c58(char *a0, int a1, int a2, int a3, int a4);
extern int func_ov007_021b2cf8(int ctx, int idx1, int idx2);
int func_ov007_021b2694(Ctx_021b299c *self) {
    int selection;
    int changed = 0;
    selection = changed;
    unsigned int pressed = data_02104bac.pressed;
    unsigned int held = data_02104bac.held;
    unsigned int repeat = data_02104bac.repeat;
    if (pressed & 2) {
        func_02022234(0, func_0202224c(0) | 0x8000);
        return 1;
    }
    if (pressed & 1) {
        func_ov007_021b2c58(data_ov007_0223352c, self->f3c, self->f40, self->f44, self->f48);
        func_02037208(func_ov007_021b2cf8((int)data_ov007_0223352c, self->f3c, self->f40), -1, 0, 1);
    } else if (pressed & 0x400) {
        self->f44++;
        if (self->f44 >= 3) self->f44 = 0;
        func_ov007_021b2c44(data_ov007_0223352c, self->f44);
        changed = 1;
    } else if (pressed & 0x800) {
        self->f48 = 1 - self->f48;
        changed = 1;
    } else if ((held & 4) && (repeat & 0x30)) {
        Entry *entry = data_020c9694;
        for (;;) { if (entry->id < 0) break; entry++; changed++; }
        if (repeat & 0x20) {
            if (--self->f4c < 0) self->f4c = changed - 1;
        } else if (repeat & 0x10) {
            if (++self->f4c >= changed) self->f4c = 0;
        }
        changed = 1;
        selection = 1;
    } else if (repeat & 0xf0) {
        if (repeat & 0x20) {
            if (--self->f3c < 0) self->f3c = 0x12;
        } else if (repeat & 0x10) {
            if (++self->f3c >= 0x13) self->f3c = 0;
        } else if (repeat & 0x40) {
            if (--self->f40 < 0) self->f40 = 2;
        } else if (repeat & 0x80) {
            if (++self->f40 >= 3) self->f40 = 0;
        }
        changed = 1;
    }
    if (changed) func_ov007_021b299c(self);
    if (selection) func_ov007_021b2b74(data_ov007_0223352c, data_020c9694[self->f4c].id);
    return 0;
}





