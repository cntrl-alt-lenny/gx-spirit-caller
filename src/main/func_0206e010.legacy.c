typedef struct node {
    char         _pad_00[0x70];
    short        m70;        /* +0x70 ldrsh */
    char         _pad_72[0x7c - 0x72];
    struct node *m7c;        /* +0x7c next */
} node_t;

extern int   OS_DisableIrq(void);
extern void  OS_RestoreIrq(int saved);
extern void  func_0206de68(node_t *p);
extern node_t *data_0219ece8;   /* active head */
extern node_t *data_0219ed48;   /* list head   */
extern int    data_0219ed4c;

int func_0206e010(void) {
    node_t *cur;
    int saved;

    for (;;) {
        saved = OS_DisableIrq();
        cur = data_0219ed48;
        if (cur != 0) {
            node_t *n = data_0219ece8;
            do {
                if (cur != n && !(cur->m70 & 0x10))
                    break;
                cur = cur->m7c;
            } while (cur != 0);
        }
        OS_RestoreIrq(saved);
        if (cur == 0)
            break;
        func_0206de68(cur);
    }

    if (data_0219ed48 != 0) {
        if (data_0219ed48 != data_0219ece8) goto ret_bad;
        if (data_0219ed48->m7c != 0) goto ret_bad;
    }
    if (data_0219ed4c == 0) return 0;
ret_bad:
    return ~0x19;
}
