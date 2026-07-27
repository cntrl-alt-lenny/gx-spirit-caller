/* func_ov002_021b3cb0: walk the linked list at data_ov002_022d0650 (stride 8,
 * next index at +6) starting at idx, looking for the first entry whose
 * kind (low nibble at +2) is 1 or 2, id(+0)==id, sub-nibble (bits[7:4] of
 * +2)==0, and (val<0 || f_4==val). Returns that entry pointer, else 0. */
typedef unsigned short u16;

extern char data_ov002_022d0650[];

struct Entry3cb0 {
    u16 f_0;
    u16 kind : 4;
    u16 sub : 4;
    u16 : 8;
    u16 f_4;
    u16 next;
};

void *func_ov002_021b3cb0(int idx, int id, int val) {
    while (idx != 0) {
        struct Entry3cb0 *e = (struct Entry3cb0 *)(data_ov002_022d0650 + idx * 8);
        int next = e->next;
        if (e->kind != 1 && e->kind != 2)
            goto fail;
        if (e->f_0 != id)
            goto fail;
        if (e->sub != 0)
            goto fail;
        if (val >= 0 && val != e->f_4)
            goto fail;
        return e;
    fail:
        idx = next;
    }
    return 0;
}
