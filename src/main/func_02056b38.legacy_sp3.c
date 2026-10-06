struct node_0205c748;
typedef struct node_0205c748 s_node_t;

typedef struct {
    char _pad[0x434];
    s_node_t *f_434;
} registry_t;

typedef struct {
    char _pad0[0x14];
    int x14;
} Sub;

typedef struct {
    char _pad0[0x8];
    Sub *x8;
    char _padc[0xc];
    int x18;
} Entry;

extern s_node_t *func_0205c7f4(registry_t **pp, int key);
extern int func_0205d6bc(void **pp, int val, int *out);
extern int func_02056c34(registry_t **pp, int key, int a2, int a3);
extern s_node_t *func_0205c748(registry_t **a0, int a1, int a2);
extern int func_0205c6e4(registry_t **pp, s_node_t *node);
extern int func_0205c54c(registry_t **pp, s_node_t *node);
extern int func_0205c3c0(registry_t **pp, s_node_t *node, int a2, int a3);

int func_02056b38(registry_t **pp, int key, int a2, int a3) {
    s_node_t *node;
    Entry *e;
    int r;

    node = func_0205c7f4(pp, key);
    if (node == 0) {
        if (func_0205d6bc((void **)pp, key, (int *)&e) == 0 || e->x8 == 0 || e->x8->x14 == 0) {
            return func_02056c34(pp, key, a2, a3);
        }
        node = func_0205c748(pp, key, 1);
        if (node == 0) {
            return 1;
        }
        if (e->x18 == 0) {
            r = func_0205c6e4(pp, node);
            if (r != 0) {
                return r;
            }
        } else {
            r = func_0205c54c(pp, node);
            if (r != 0) {
                return r;
            }
        }
    }
    r = func_0205c3c0(pp, node, a2, a3);
    if (r == 0) {
        return 0;
    }
    return r;
}
