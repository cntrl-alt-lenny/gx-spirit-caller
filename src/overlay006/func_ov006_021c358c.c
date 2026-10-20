typedef struct { int key; int val; int pad; } Ent;
typedef struct { char pad0[0x14]; int n; Ent ents[1]; } Obj;
extern int func_02021660(Obj *o, int key, int idx);
extern void func_020216b0(void *p, int unused1, int unused2);
extern int data_ov006_0225e068[];
typedef struct { int value; int pad[3]; } Entry;
typedef struct { int pad0; Obj *obj; char pad8[0x5c]; int index; int enabled; char pad6c[0x30]; Entry entries[1]; } State;
int func_ov006_021c358c(State *self) {
    int index = self->index;
    Entry *entries = self->entries;
    void *handle;
    int style;
    int i;
    int key;
    int y;
    int offset;
    int x;
    int base = 0x1c9;
    int alternate = base - 8;
    for (i = 0; i < 2; i++) {
        if (i == 0) key = 0x21; else key = 8;
        handle = (void *)func_02021660(self->obj, 5, key);
        if (self->enabled != 0 && entries[index].value >= 0 && entries[index].value < 6) {
            if (i == 0) {
                int cond;
                style = 0x1c9;

                if ((data_ov006_0225e068[0] ? 1 : 0) == 0) style |= 0x20;
            } else style = alternate;
        } else style = 0;
        if (i == 0) {
            offset = 0;
            x = 0xb;
            y = entries[index].value * 0x13 + 0x1b;
        } else {
            offset = 0x13;
            x = 0xf;
            y = entries[index].value * 0x13 + 0x1e;
        }
        func_020216b0(handle, 2, key);
        func_020216b0(handle, 3, x);
        func_020216b0(handle, 4, y);
        func_020216b0(handle, 0x11, 3);
        func_020216b0(handle, 0x12, 0);
        func_020216b0(handle, 0xc, 0);
        func_020216b0(handle, 0xd, offset);
        func_020216b0(handle, 0, style);
    }
    return 1;
}





