typedef struct node {
    int f_0;
    struct node *f_4;
    struct node *f_8;
    char _pad_c[0x1c - 0xc];
    int f_1c;
} node_t;

typedef struct {
    node_t *f_0;
    unsigned short f_4;
    unsigned short f_6;
    int f_8;
} list_ctl_t;

extern node_t *data_021a8308;
extern list_ctl_t data_021a830c;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);

void func_02097668(node_t *n) {
    int saved;
    if (n->f_0 == 0) {
        return;
    }
    saved = OS_DisableIrq();
    if (n->f_4 != 0) {
        n->f_4->f_8 = n->f_8;
    }
    if (n->f_8 != 0) {
        n->f_8->f_4 = n->f_4;
    }
    n->f_0 = 0;
    n->f_8 = 0;
    n->f_4 = n->f_8;
    n->f_1c = n->f_1c & ~1;
    if (data_021a830c.f_0 == n) {
        data_021a830c.f_8 = 0;
        data_021a830c.f_6 = 0;
        data_021a830c.f_0 = data_021a8308;
        data_021a830c.f_4 = 0;
    }
    OS_RestoreIrq(saved);
}
