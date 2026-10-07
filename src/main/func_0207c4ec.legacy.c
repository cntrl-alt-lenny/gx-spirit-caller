/* func_0207c4ec: find the list node whose 6-byte address equals addr, in the
 * list headed at data_021a088c + 0x2270 (only once the table is populated). */
typedef struct Node Node;
typedef struct {
    int f0;
    unsigned char mac[6];
} Info;
struct Node {
    unsigned char _pad_00[4];
    int f4;
    unsigned char _pad_08[4];
    Node *next;
    Info info;
};
typedef struct {
    unsigned char _pad_00[4];
    Node *first;
} Head;
typedef struct {
    unsigned char _pad_00[0x2270];
    Head *head;
    unsigned int count;
} Block;
extern Block *func_0207b538(void);
extern int func_0207cf78(void *a, void *b);

Node *func_0207c4ec(unsigned char *addr) {
    Block *b = func_0207b538();
    Node *n = 0;
    Head *h = b->head;

    if (addr == 0) {
        return 0;
    }
    if (h != 0 && b->count > 0xc) {
        for (n = h->first; n != 0; n = n->next) {
            if (func_0207cf78((char *)&n->info + 4, addr) != 0) {
                break;
            }
        }
    }
    return n;
}
