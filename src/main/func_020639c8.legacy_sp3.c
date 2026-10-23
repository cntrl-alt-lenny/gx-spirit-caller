typedef struct { int f_0; int f_4; } pair_t;
typedef struct { char _pad0[0x44]; char f_44[0x18]; int f_5c; } s_02063a4c_t;
typedef struct {
    char pad0[0x44];
    int base;
    char pad48[0x14];
    char *queue;
    char pad60[6];
    unsigned short seq;
} Obj;
typedef struct { int offset; int length; int type; unsigned short seq; } Item;
extern void *func_020540d0(char *s, int index);
extern int func_02054140(void *p);
extern void func_02063a4c(s_02063a4c_t *a0, pair_t *a1, int a2);
extern int func_02063ca4(void *a0, int a1, int a2, int a3);
int func_020639c8(Obj *self) {
    int i;
    Item *item;
restart:
    for (i = func_02054140(self->queue) - 1; i >= 0; i--) {
        item = func_020540d0(self->queue, i);
        if (item->seq == self->seq) {
            if (func_02063ca4(self, item->type, self->base + item->offset, item->length) == 0) return 0;
            func_02063a4c((s_02063a4c_t *)self, (pair_t *)item, i);
            goto restart;
        }
    }
    return 1;
}
