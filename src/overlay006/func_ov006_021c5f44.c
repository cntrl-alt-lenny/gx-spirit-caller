typedef struct { int key, val, pad; } Ent;
typedef struct { char pad0[0x14]; int n; Ent ents[1]; } Obj;
typedef struct { char pad[0x3c]; int f_3c, f_40; } state_3c_40_t;
typedef struct { int a, b, c; unsigned flag:1; unsigned rest:31; } Row;
typedef struct { short x,y; int pad; short a,b; int c,d,e,f; } Display;
typedef struct { Obj *obj; char pad[0x48]; int index; char pad2[0x18]; int selected; Row rows[1]; } Self;
extern int func_02021660(Obj *o, int key, int idx);
extern void func_020216b0(void *p, int unused1, int unused2);
extern int func_020b3870(int, int);
extern int func_ov006_021c6f24(state_3c_40_t *p);
extern state_3c_40_t data_ov006_0225deb4;
extern Display data_ov006_021ce0a8[];
extern struct { char pad[0x18]; int mode; } data_ov000_021b1d4c;
int func_ov006_021c5f44(Self *self) {
    Row *row = &self->rows[self->index];
    void *h; int i; int color; int x, y; Display *d = data_ov006_021ce0a8; int p0;
    i = 0;
    do {
        h = (void *)func_02021660(self->obj, 5, i);
        p0 = 0;


        if (i != 3 && (row->flag || i < 3 || i > 6 || i == 3)) {
            if (func_ov006_021c6f24(&data_ov006_0225deb4) || i != 2) p0 = 0x1c1;
        }
        if (i == self->selected) color = d->f;
        else if (row->flag) {
            int mode = data_ov000_021b1d4c.mode;
            if ((mode == 1 && i == 6) || (mode == 2 && i == 4) || (mode == 3 && i == 5)) color = d->f;
            else color = d->d;
        } else color = d->d;
        x = d->x; y = d->y;
        if (row->flag && i == 6) y += func_020b3870(row->b * 70, row->c - 6);
        func_020216b0(h,2,i);
        func_020216b0(h,3,x);
        func_020216b0(h,4,y);
        func_020216b0(h,0x11,d->a);
        func_020216b0(h,0x12,d->b);
        func_020216b0(h,0xc,d->c);
        func_020216b0(h,0xd,color);
        func_020216b0(h,0,p0);
        d++; i++;
    } while (i < 7);
    return 1;
}







