typedef struct {
    char _pad0[8];
    unsigned short count;   /* offset 0x8 */
    char _pad1[0xc];
    unsigned int max;       /* offset 0x18 */
    char _pad2[8];          /* pad struct to full stride 0x24 */
} Entry_t;

typedef struct {
    void *head;              /* offset 0x0 */
} List_t;

extern Entry_t data_021a4bd4[];

extern void func_02087dc8(List_t *a);
extern void *func_0207cef4(Entry_t *e, int x);
extern void func_020876a8(void *result);
extern void *func_02087634(int id);
extern void func_0208773c(Entry_t *e, void *node);

void *func_02087920(List_t *a, int idx, int id) {
    Entry_t *e = &data_021a4bd4[idx];
    void *node;

    if (a->head != 0) {
        func_02087dc8(a);
    }
    if (e->count >= e->max) {
        void *result = func_0207cef4(e, 0);
        if (result == 0) {
            return 0;
        }
        if (id < ((unsigned char *)result)[0x3d]) {
            return 0;
        }
        func_020876a8(result);
    }
    node = func_02087634(id);
    if (node == 0) {
        return 0;
    }
    func_0208773c(e, node);
    *(void **)node = a;
    a->head = node;
    return node;
}
