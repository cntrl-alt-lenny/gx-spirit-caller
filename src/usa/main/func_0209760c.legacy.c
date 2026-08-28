/* func_0209760c: insert-if-absent into an intrusive singly-linked list
 * rooted at data_021a8228 (append at tail), updating the sibling
 * data_021a822c control block only on the first-ever insert.
 */

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

extern node_t *data_021a8228;
extern list_ctl_t data_021a822c;
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern int func_020976cc(int a1, int a2);
extern int func_02097c6c(int a1, int a2);

int func_0209760c(node_t *a0, int a1, int a2) {
    int result = 0;
    int saved = OS_DisableIrq();
    if (func_020976cc(a1, a2) == 0) {
        node_t *head = data_021a8228;
        if (head == 0) {
            data_021a8228 = a0;
            data_021a822c.f_0 = a0;
            data_021a822c.f_8 = 0;
            data_021a822c.f_6 = 0;
            data_021a822c.f_4 = 0;
        } else {
            node_t *cur = head;
            node_t *next = head->f_4;
            if (next != 0) {
                do {
                    cur = next;
                    next = cur->f_4;
                } while (next != 0);
            }
            cur->f_4 = a0;
            a0->f_8 = cur;
        }
        a0->f_0 = func_02097c6c(a1, a2);
        result = 1;
        a0->f_1c = a0->f_1c | 1;
    }
    OS_RestoreIrq(saved);
    return result;
}
