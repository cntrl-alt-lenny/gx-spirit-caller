/* func_ov006_021c50cc: 4-state open/animate/close dispatcher (dense jump
 * table on self->f_3c). data_ov006_0225dc14 is the shared Ov006GState
 * blob (struct + field names per func_ov006_021c52b8.c, its established
 * matched sibling — this function does the REVERSE field copy of that
 * one, f_6c->f_c etc instead of f_c->f_6c). data_ov006_0225deb4 is an
 * Ov006Obj6d8c-shaped record (func_ov006_021c6d8c.c) driven by the
 * per-slot table entry at self+0x7c+sum*0x10.
 */
struct Ov006Obj {
    char pad0[4];
    void *f_4;
    char pad8[0x3c - 0x8];
    int f_3c;
    int f_40;
    char pad44[0x4c - 0x44];
    int f_4c;
    int f_50;
};

struct Ov006GState {
    char pad0[0xc];
    int f_c, f_10, f_14, f_18, f_1c;
    char pad20[0x6c - 0x20];
    int f_6c;
    char pad70[0x8c - 0x70];
    int f_8c, f_90, f_94, f_98;
};

extern struct Ov006GState data_ov006_0225dc14;
extern char data_ov006_0225deb4[];

extern int func_0202224c(int idx);
extern int func_02022234(unsigned int idx, unsigned int v);
extern int func_020215d8(void *p);
extern int func_ov006_021c52b8(struct Ov006Obj *obj);
extern int func_ov006_021c53bc(void *self);
extern int func_ov006_021c5d98(int this_, int on);
extern int func_ov006_021c6640(int this_, int flag);
extern int func_ov006_021c6d8c(void *obj, int arg1);
extern int func_ov006_021c6e40(int *self, int arg1, int arg2);
extern int func_ov006_021c6f7c(void *obj, int value);
extern int func_ov006_021c6f88(void *obj, int value);
extern int func_ov006_021c6f94(void *obj, int value);

int func_ov006_021c50cc(struct Ov006Obj *self) {
    int flags = func_0202224c(0);

    switch (self->f_3c) {
    case 0:
        if (self->f_40 == 3) {
            func_ov006_021c52b8(self);
            self->f_3c = 1;
            self->f_40 = 0;
        }
        break;
    case 1: {
        int f40 = self->f_40;
        if (f40 == 3) {
            int idx = self->f_4c;
            char *base = (char *)self + idx * 0x10;
            int sum = *(int *)(base + 0x70) + *(int *)(base + 0x6c);
            char *elem = (char *)self + 0x7c + sum * 0x10;

            func_ov006_021c6d8c(data_ov006_0225deb4, 1);
            func_ov006_021c6f7c(data_ov006_0225deb4, *(int *)(elem + 0x4));
            func_ov006_021c6f88(data_ov006_0225deb4, *(int *)(elem + 0x8));
            func_ov006_021c6f94(data_ov006_0225deb4, *(int *)elem == 0 ? 1 : 0);
            func_ov006_021c6e40((int *)data_ov006_0225deb4, *(int *)elem, 0);
            func_ov006_021c5d98((int)self, 1);
            func_ov006_021c6640((int)self, 1);
        } else if (f40 == 0xf) {
            self->f_50 = 1;
        }
        if (func_ov006_021c53bc(self) != 0) {
            struct Ov006GState *g = &data_ov006_0225dc14;
            g->f_c = g->f_6c;
            flags |= 1;
            g->f_10 = g->f_8c;
            g->f_14 = g->f_90;
            g->f_18 = g->f_94;
            g->f_1c = g->f_98;
            self->f_3c = 2;
            self->f_40 = 0;
        }
        break;
    }
    case 2:
        if (self->f_40 == 0xc) {
            func_ov006_021c6640((int)self, 0);
        }
        if (func_020215d8(self->f_4) == 0) {
            self->f_4 = 0;
            self->f_3c = 3;
            self->f_40 = 0;
        }
        break;
    case 3:
        return 1;
    }

    {
        int idx = self->f_4c;
        char *base = (char *)self + idx * 0x10;
        int sum = *(int *)(base + 0x70) + *(int *)(base + 0x6c);
        char *elem = (char *)self + sum * 0x10;
        if (*(int *)(elem + 0x7c) == 0)
            flags |= 0x40;
        else
            flags &= ~0x40;
    }
    func_02022234(0, flags);
    self->f_40 = self->f_40 + 1;
    return 0;
}
