typedef struct { int key; int val; int pad; } Ent;
typedef struct { char pad0[0x14]; int n; Ent ents[1]; } Obj;
typedef struct {
    Obj *obj;
    int pad4, pad8, selection, previous, timer, mode, changed;
} State;
typedef struct {
    short id, a, b, c, d, e, f, g, h, i;
    unsigned char pad14[3];
    unsigned char kind;
} Record;
extern int func_02021660(Obj *o, int key, int idx);
extern void func_020216b0(void *p, int unused1, int unused2);
extern int func_0202de9c(int unused0);
extern Record *func_ov006_021c1958(State *s, int selection);
int func_ov006_021c17c8(State *s) {
    int handle;
    Record *record;
    int flags;
    int id;
    handle = func_02021660(s->obj, 3, 0);
    record = func_ov006_021c1958(s, s->selection);
    if (record && s->timer >= 15) {
        func_020216b0((void *)handle, 15, record->a);
        func_020216b0((void *)handle, 16, record->b);
        func_020216b0((void *)handle, 14, record->kind);
        func_020216b0((void *)handle, 10, record->i);
        func_020216b0((void *)handle, 3, s->mode ? record->f : record->c);
        func_020216b0((void *)handle, 4, s->mode ? record->g : record->d);
        func_020216b0((void *)handle, 5, s->mode ? record->h : record->e);
        id = record->id;
        flags = 0x41;
        if (id != s->previous) flags |= 0x200;
        if (s->changed) {
            s->changed = 0;
            flags |= 0x400;
        }
        if (s->mode) flags |= 4;
        s->previous = id;
    } else {
        flags = 0;
        s->previous = -1;
    }
    func_020216b0((void *)handle, 0, flags);
    handle = func_02021660(s->obj, 3, 1);
    flags = 0;
    if (!record && s->timer >= 15 && s->selection != 0) {
        if ((unsigned)(func_0202de9c(s->selection) - 7) <= 1) flags |= 1;
    }
    func_020216b0((void *)handle, 0, flags);
    s->timer++;
    return 1;
}

