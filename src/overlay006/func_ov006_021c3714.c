typedef struct { int key, val, pad; } Ent;
typedef struct { char pad[0x14]; int n; Ent ents[1]; } Obj;
extern int func_02021660(Obj *o, int key, int idx);
extern void func_020216b0(void *p, int unused1, int unused2);
extern int func_020b3870(int a, int b);
typedef struct { int value, count, total; unsigned active:1; unsigned other:31; } Entry;
typedef struct { int pad0; Obj *obj; char pad8[0x50]; int mode; char pad5c[8]; int index; char pad68[0x30]; int selected; Entry entries[1]; } State;
typedef struct { short x,y,a,b,s,t; int c,d,e,f; } Icon;
extern Icon data_ov006_021cdea8[];
extern short data_ov006_021cde2c[][2];
extern int data_ov000_021b1d4c[];
int func_ov006_021c3714(State *self, int first, int second, int third) {
    Entry *entry = &self->entries[self->index];
    void *handle;
    int style;
    int i;
    int y;
    Icon *icon = data_ov006_021cdea8;
    int color;
    int x;
    int base = 0x1c1;
    for (i=0; i<8; icon++,i++) {
        if (i >= 0 && i <= 1) { if (first) {} else continue; }
        else if (i >= 2 && i <= 3) { if (second) {} else continue; }
        else if (i >= 4 && i <= 7) { if (!third) continue; }
        handle = (void *)func_02021660(self->obj, 5, i);
        style = 0;
        if (i != 4 && (entry->active != 0 || i < 4 || i > 7 || i == 4)) {
            style = base;
            if (i == 2) {
                switch (data_ov006_021cde2c[self->mode][0]) {
                case 0: style |= 2; break;
                case 1: style = 0; break;
                case 2: if (self->index == 0) style |= 2; break;
                }
            } else if (i == 3) {
                switch (data_ov006_021cde2c[self->mode][0]) {
                case 0: style = 0; break;
                case 1: style |= 2; break;
                case 2: if (self->index == 1) style |= 2; break;
                }
            }
        }
        if (i == self->selected) color = icon->f;
        else if (entry->active) {
            int mode = data_ov000_021b1d4c[6];
            if ((mode == 1 && i == 7) || (mode == 2 && i == 5) || (mode == 3 && i == 6)) color = icon->f;
            else color = icon->d;
        } else color = icon->d;
        x = icon->x;
        y = icon->y;
        if (entry->active && i == 7) y += func_020b3870(entry->count * 0x35, entry->total - 6);
        if (style & 2) y--;
        func_020216b0(handle,2,i);
        func_020216b0(handle,3,x);
        func_020216b0(handle,4,y);
        func_020216b0(handle,0x11,icon->s);
        func_020216b0(handle,0x12,icon->t);
        func_020216b0(handle,0xc,icon->c);
        func_020216b0(handle,0xd,color);
        func_020216b0(handle,0,style);
    }
    return 1;
}







