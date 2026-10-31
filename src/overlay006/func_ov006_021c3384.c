typedef struct { int key; int val; int pad; } Ent;
typedef struct { char pad0[0x14]; int n; Ent ents[1]; } Obj;
extern int func_02021660(Obj *o, int key, int idx);
extern void func_020216b0(void *p, int unused1, int unused2);
typedef struct {
    short x, y, gridCol, gridRow, unk08, unk0A;
    int unk0C, iconId0, iconId1, iconId2;
} DuelIconEntry;
extern DuelIconEntry data_ov006_021cdf88[8];
extern short data_ov006_021cddec[];
typedef struct {
    Obj *obj;
    char pad04[0x58];
    int col, row;
    int pad64;
    int flag;
    char pad6c[0x2c];
    int selected;
} State;
int func_ov006_021c3384(State *self) {
    int key;
    void *handle;
    int i;
    int icon;
    DuelIconEntry *e;
    e = data_ov006_021cdf88;
    key = 5;
    for (i = 0; i < 8; e++, i++) {
        handle = (void *)func_02021660(self->obj, key, i);
        if (i >= 1 && i <= 7) {
            if (e->gridCol == self->col && e->gridRow == self->row && self->flag != 0)
                icon = e->iconId1;
            else
                icon = e->iconId0;
        } else {
            if (i == self->selected) icon = e->iconId2;
            else icon = e->iconId0;
        }
        func_020216b0(handle, 2, i);
        func_020216b0(handle, 3, e->x);
        func_020216b0(handle, 4, e->y);
        func_020216b0(handle, 0x11, e->unk08);
        func_020216b0(handle, 0x12, e->unk0A);
        func_020216b0(handle, 0xc, e->unk0C);
        func_020216b0(handle, 0xd, icon);
        func_020216b0(handle, 0xe, data_ov006_021cddec[i]);
        func_020216b0(handle, 0, 0x1c1);
    }
    return 1;
}



