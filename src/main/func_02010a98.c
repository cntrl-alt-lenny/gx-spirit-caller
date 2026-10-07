typedef unsigned short u16;

typedef struct {
    char _pad0[0x40];
    u16 head;
    u16 tail;
} Queue;

typedef struct {
    int _pad0[2];
    int key;
    int _pad1[3];
} Entry;

typedef struct {
    char _pad0[0x1940];
    union {
        Entry entries[0x100];
        struct {
            char _pad[0x17c0];
            Queue q;
        } ring;
    } u;
} Globals;

extern Queue data_0218fcc8;
extern Globals data_0218cbc8;

int func_02010a98(int key) {
    Globals *g = &data_0218cbc8;
    u16 i = data_0218fcc8.head;

    if (i != data_0218fcc8.tail) {
        do {
            Entry *e = &g->u.entries[i];
            if (e->key == key) {
                e->key = 0;
            }
            i++;
            if (i >= 0x100) {
                i = 0;
            }
        } while (i != g->u.ring.q.tail);
    }
    return 1;
}
