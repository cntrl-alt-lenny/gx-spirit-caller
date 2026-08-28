typedef struct node {
    char         _pad_00[0x70];
    short        m70;        /* +0x70 ldrsh */
    char         _pad_72[0x7c - 0x72];
    struct node *m7c;        /* +0x7c next */
} node_t;

extern int   OS_DisableIrq(void);
extern void  OS_RestoreIrq(int saved);
extern void  func_0206ddf4(node_t *p);
extern node_t *data_0219ec08;   /* active head */
extern node_t *data_0219ec68;   /* list head   */
extern int    data_0219ec6c;

int func_0206df9c(void) {
    node_t *cur;
    int saved;

    for (;;) {
        saved = OS_DisableIrq();
        cur = data_0219ec68;
        if (cur != 0) {
            node_t *n = data_0219ec08;
            do {
                if (cur != n && !(cur->m70 & 0x10))
                    break;
                cur = cur->m7c;
            } while (cur != 0);
        }
        OS_RestoreIrq(saved);
        if (cur == 0)
            break;
        func_0206ddf4(cur);
    }

    if (data_0219ec68 != 0) {
        if (data_0219ec68 != data_0219ec08) goto ret_bad;
        if (data_0219ec68->m7c != 0) goto ret_bad;
    }
    if (data_0219ec6c == 0) return 0;
ret_bad:
    return ~0x19;
}
