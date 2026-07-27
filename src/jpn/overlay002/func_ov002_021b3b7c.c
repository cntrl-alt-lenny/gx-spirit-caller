/* func_ov002_021b3b7c: walk a linked list of 8-byte records at
 * data_ov002_022d0570 starting at node index arg0 (next index at +6);
 * skip records whose 4-bit field at +2 is >=6; return the first record
 * whose id(+0)==arg1 && field==arg2, else 0. */
typedef unsigned short u16;
extern char data_ov002_022d0570[];

struct Rec3c5c { u16 id; u16 field : 4; u16 _pad; u16 next; };

struct Rec3c5c *func_ov002_021b3b7c(int node, int id, int field) {
    struct Rec3c5c *r;
    if (node == 0)
        goto notfound;
    do {
        r = (struct Rec3c5c *)((char *)data_ov002_022d0570 + node * 8);
        node = r->next;
        if (r->field < 6 && r->id == id && r->field == field)
            return r;
    } while (node != 0);
notfound:
    return 0;
}
