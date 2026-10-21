typedef struct { int key, val, pad; } Ent;
typedef struct { char pad0[0x14]; int n; Ent ents[1]; } Obj;
typedef struct { int x, y; int rest[7]; } Slot;
typedef struct { Obj *obj; char pad[0x3c]; int mode; int f44; int selected; int index; int slot; char pad54[0x4c]; Slot slots[1]; } State;
typedef struct { short x, y; int value, pad; } Layout;
extern int func_02021660(Obj *o, int key, int idx);
extern void func_020216b0(void *p, int unused1, int unused2);
extern int data_ov006_0225df3c;
extern int data_ov006_0225e068;
extern Layout data_ov006_021cc588[];
extern Layout data_ov006_021cc478[];
extern Layout data_ov006_021cc0f4[];
typedef enum { FALSE, TRUE } Bool;
static inline Bool flag(int *p) { return *p != 0; }
int func_ov006_021bbe7c(State *s) {
    int *a = &data_ov006_0225df3c;
    int *b = &data_ov006_0225e068;
    void *handle;
    int flags;
    Slot *slot = &s->slots[s->slot];
    Layout *layout;
    int limit, x, y;
    handle = (void *)func_02021660(s->obj, 5, 0);
    flags = 0x8c9;
    if (!flag(a) && !flag(b) && s->selected == 0) flags |= 0x20;
    switch (s->mode) {
    case 0: case 3: layout = &data_ov006_021cc588[s->index]; break;
    case 2: layout = &data_ov006_021cc478[s->index]; break;
    default: layout = &data_ov006_021cc0f4[s->index]; break;
    }
    func_020216b0(handle, 3, layout->x);
    func_020216b0(handle, 4, layout->y);
    func_020216b0(handle, 0x11, 2);
    func_020216b0(handle, 0x12, 0);
    func_020216b0(handle, 0xd, layout->value);
    func_020216b0(handle, 0, flags);
    handle = (void *)func_02021660(s->obj, 5, 1);
    limit = s->slot == 4 ? 3 : 4;
    y = slot->y;
    if (y >= 0 && y < limit) {
        flags = 0x8c9;
        if (!flag(a) && !flag(b) && s->selected == 1) flags |= 0x20;
    } else flags = 0;
    if (s->slot == 4) { x = slot->x * 0x17 + 0xe; y = y * 0x20 + 0x56; }
    else { x = slot->x * 0x17 + 0xe; y = y * 0x20 + 0x36; }
    func_020216b0(handle, 3, x);
    func_020216b0(handle, 4, y);
    func_020216b0(handle, 0x11, 2);
    func_020216b0(handle, 0x12, 0);
    func_020216b0(handle, 0xd, 0);
    func_020216b0(handle, 0, flags);
    return 1;
}












