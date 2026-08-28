/* func_ov002_021b1f08: allocate a new node index for a0 via
 * func_ov002_021b1c68, append it to the tail of the singly-linked list
 * rooted at data_ov002_022d0172[a0] (chained through the u16 "next"
 * field at offset 0 of each 8-byte data_ov002_022d0576 node), then
 * initialize the new data_ov002_022d0570 entry: kind/sub nibbles packed
 * from a1, f_0=a2, f_4=a3, next=0.
 */
#include "ov002_core.h"

struct Entry0650 {
    u16 f_0;
    u16 kind : 4;
    u16 sub : 4;
    u16 : 8;
    u16 f_4;
    u16 next;
};

extern char data_ov002_022d0172[];
extern char data_ov002_022d0576[];
extern struct Entry0650 data_ov002_022d0570[];
extern int func_ov002_021b1c68(int a0);

void func_ov002_021b1f08(int a0, int a1, int a2, int a3) {
    int newIdx;
    u16 head;
    u16 idx;
    u16 *p;
    unsigned char lo;
    unsigned char hi;
    struct Entry0650 *e;

    newIdx = func_ov002_021b1c68(a0);
    head = *(u16 *)(data_ov002_022d0172 + a0 * 4);
    p = (u16 *)(data_ov002_022d0172 + a0 * 4);
    e = &data_ov002_022d0570[newIdx];

    if (head == 0) goto write;

    idx = head;
    do {
        p = (u16 *)(data_ov002_022d0576 + idx * 8);
        idx = *p;
    } while (idx != 0);

write:
    *p = (u16)newIdx;

    lo = a1 & 0xf;
    hi = (a1 & 0xf0) >> 4;
    e->kind = lo;
    e->sub = hi;
    e->f_0 = a2;
    e->f_4 = a3;
    e->next = 0;
}
