typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

struct Node {
    char pad0[0x10];
    struct Node *next;
    char pad14[5];
    u8 count;
    u16 flags[1];
};

void func_02084bc8(u32 *bits, struct Node *n)
{
    if (n == 0) {
        return;
    }
    do {
        int i;
        for (i = 0; i < n->count; i++) {
            if (n->flags[i] & 0x100) {
                bits[i >> 5] |= 1 << (i & 0x1f);
            }
        }
        n = n->next;
    } while (n != 0);
}
