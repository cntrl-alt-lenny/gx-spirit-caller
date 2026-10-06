typedef struct node node_t;

typedef struct {
    char _pad0[0x428];
    void *set;
    int x42c;
    int x430;
} Owner;

extern void *func_02054840(int elem_size, int grow, int (*cmp)(int *p),
                           int (*eq)(int *a, int *b), void (*dtor)(node_t *p));
extern void func_0205d9a0(node_t *p);
extern int func_0205da2c(int *p);
extern int func_0205da1c(int *a, int *b);

int func_0205d944(Owner **pp) {
    Owner *o = *pp;

    o->x430 = 0;
    o->x42c = 0;
    o->set = func_02054840(0x1c, 4, func_0205da2c, func_0205da1c, func_0205d9a0);
    return o->set != 0;
}
