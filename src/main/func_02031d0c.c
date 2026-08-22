/* func_02031d0c: intrusive-list node "release". If flags&1, drain the
 * node's own sub-list (it doubles as a list head via field_18/next, same
 * shape func_02031a70 walks). If flags&4, run func_02031c8c's cleanup.
 * If the sub-list is still non-empty, stash our own address as a re-entry
 * marker and bail; otherwise unlink + push onto the free list and clear
 * the pending-count fields. */
typedef struct Obj02031d0c {
    char          pad0[0x8];
    void         *field_8;   /* +0x8  re-entry marker */
    char          pad0c[0x4];
    int           field_10;  /* +0x10 */
    int           field_14;  /* +0x14 */
    void         *field_18;  /* +0x18 sub-list head ("first") */
    char          pad1c[0x2c - 0x1c];
    unsigned int  flags;     /* +0x2c */
} Obj02031d0c;

extern void func_02031a70(void *h, int a, int b, int c);
extern void func_02031afc(void *node);
extern void func_02031b74(void *node);
extern void func_02031c8c(void *node);

void func_02031d0c(Obj02031d0c *node) {
    if (node->flags & 0x1) {
        func_02031a70(node, -0x10000, 0, 0);
    }
    if (node->flags & 0x4) {
        func_02031c8c(node);
    }
    if (node->field_18 != 0) {
        node->field_8 = (void *)func_02031d0c;
        return;
    }
    func_02031afc(node);
    func_02031b74(node);
    node->field_10 = 0;
    node->field_14 = 0;
}
