typedef struct { int key, val, pad; } Ent;
typedef struct { char pad0[0x14]; int n; Ent ents[1]; } Obj;
typedef struct {
    Obj *handle;
    char pad04[0x38];
    int state;
    int pad40;
    int column, row;
    int pad4c;
    int timer;
    char pad54[0x48];
    int clear[10];
} State;
extern int func_0202224c(int idx);
extern int func_02021660(Obj *o, int key, int idx);
extern void func_020216b0(void *p, int unused1, int unused2);
/* The forwarding thunk's result is consumed here although its C definition is void. */
extern int func_020216bc(void *p, int unused1);
extern int func_ov021_021abcac(void *o);
extern int func_ov021_021ab9d0(void *o);
extern unsigned int func_02006194(void);
extern unsigned int func_0200617c(void);
extern void func_02006110(int *out_a, int *out_b);
extern struct { char pad[0x54]; unsigned short pressed, repeat; } data_02104bac;
int func_ov021_021ab3fc(State *o) {
    int x, y;
    int col, row;
    void *p;
    int flags;
    if (func_0202224c(0) & 1) {
        func_020216b0((void *)func_02021660(o->handle, 3, 2), 11, 0);
        func_ov021_021abcac(o);
        return 1;
    }
    if (o->timer > 0) {
        o->timer--;
        func_020216b0((void *)func_02021660(o->handle, 3, 2), 11, 0);
        func_ov021_021abcac(o);
        return 1;
    }
    func_020216b0((void *)func_02021660(o->handle, 3, 2), 11, 31);
    int keys = data_02104bac.pressed;
    int repeat = data_02104bac.repeat;
    int changed = 0;
    int confirm = 0;
    if (func_02006194() != 0 || func_0200617c() != 0) {
        func_02006110(&x, &y);
        col = (x + 40) / 48 - 1;
        row = (y + 48) / 72 - 1;
        if (col >= 0 && col < 5 && row >= 0 && row < 2) {
            o->column = col;
            o->row = row;
            changed = 1;
            if (func_0200617c() != 0) confirm = 1;
        }
    } else if (keys & 1) {
        confirm = 1;
    } else if (repeat & 0xf0) {
        if (repeat & 0x20) {
            if (--o->column < 0) o->column = 4;
        } else if (repeat & 0x10) {
            if (++o->column >= 5) o->column = 0;
        } else if (repeat & 0x40) {
            if (--o->row < 0) o->row = 1;
        } else if (repeat & 0x80) {
            if (++o->row >= 2) o->row = 0;
        }
        changed = 1;
    }
    if (changed) {
        p = (void *)func_02021660(o->handle, 3, 2);
        flags = func_020216bc(p, 0) | 0x10;
        func_020216b0(p, 3, (o->column - 2) * 72);
        func_020216b0(p, 4, o->row == 0 ? 56 : -56);
        func_020216b0(p, 0, flags);
    }
    if (confirm && o->clear[o->column + o->row * 5] == 0) {
        func_ov021_021ab9d0(o);
        func_020216b0((void *)func_02021660(o->handle, 3, 2), 11, 0);
        o->state = 1;
    }
    func_ov021_021abcac(o);
    return 1;
}

