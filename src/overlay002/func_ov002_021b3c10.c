/* func_ov002_021b3c10: search the d0650 node chain (start id in idx) for the
 * first node with tag(:4 at +2) < 6 AND key0(+0) == key; return that node
 * pointer, else 0. next(+6) is loaded early and doubles as the loop index. */

typedef unsigned short u16;

extern char data_ov002_022d0650[];

struct LNodeC10 { u16 key0; u16 tag : 4; u16 _rest : 12; u16 key1; u16 next; };

void *func_ov002_021b3c10(int idx, int key)
{
    struct LNodeC10 *p;

    while (idx != 0) {
        p = (struct LNodeC10 *)(data_ov002_022d0650 + idx * 8);
        idx = p->next;
        if (p->tag < 6 && p->key0 == key) {
            return p;
        }
    }
    return 0;
}
