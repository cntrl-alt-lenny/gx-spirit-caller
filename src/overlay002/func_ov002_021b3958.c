/* func_ov002_021b3958: walk the linked list rooted at the per-player/slot
 * head in data_ov002_022cf1a6, looking for an entry in data_ov002_022d0650
 * (stride 8) whose low nibble at +2 equals 13; return its +0 field, or
 * 0xffff if the head is empty / no such entry is found. */
typedef unsigned short u16;

extern char data_ov002_022cf1a6[];
extern char data_ov002_022d0650[];

struct Ov002D0650Entry {
    u16 val;
    u16 kind : 4;
    u16 _pad2 : 12;
    u16 _unused4;
    u16 next;
};

u16 func_ov002_021b3958(int arg0, int arg1) {
    int player = arg0 & 1;
    u16 v = *(u16 *)(data_ov002_022cf1a6 + player * 0x868 + arg1 * 20);
    if (v == 0) {
        goto not_found;
    }
    do {
        struct Ov002D0650Entry *e = (struct Ov002D0650Entry *)(data_ov002_022d0650 + v * 8);
        u16 kind = e->kind;
        u16 next = e->next;
        if (kind == 13) {
            return e->val;
        }
        v = next;
    } while (v != 0);
not_found:
    return 0xffff;
}
