typedef struct Node_0200fa90 Node_0200fa90;
struct Node_0200fa90 { Node_0200fa90 *next, *prev; int f8; unsigned int key; };
typedef struct list_node { struct list_node *prev, *next; } list_node_t;
typedef struct Node0200fdc0 { struct Node0200fdc0 *next; char pad[0x8]; unsigned int fieldc; } Node0200fdc0;
typedef struct { char pad[0x8]; int field8; } Arg0200fdc0;
extern Node_0200fa90 *func_0200fa90(Node_0200fa90 *, Node_0200fa90 *);
extern int List_Unlink(list_node_t *);
extern Node0200fdc0 *func_0200fdc0(Arg0200fdc0 *);
extern void func_02090048(void);
extern void func_02090114(void);
extern void func_020900a0(const void *, unsigned int, unsigned int);
extern void func_02092904(const void *, unsigned int);
typedef struct { const void *source; unsigned int size; int key; } Entry;
typedef struct {
    char pad0[0x1c]; Entry *entries;
    char pad20[0x40];
    struct { unsigned int active:1; unsigned int disabled:1; unsigned int ready:1; unsigned int rest:29; } flags;
    char pad64[0x18];
    union { unsigned int value; struct { unsigned int low:27; unsigned int pending:1; unsigned int high:4; } bits; } status;
    char pad80[0x1e4]; int key; int index;
    char pad26c[0x10]; int busy; int end;
} Object;
extern struct { char pad[0xc]; int count; int unused; Object *objects; } data_02186ae8;
int func_0200c2f8(void) {
    int key;
    Entry *entry;
    Node_0200fa90 *node;
    Node_0200fa90 *tail;
    Object *object = data_02186ae8.objects;
    int i;
    if (!object) return 0;
    for (i = 0; i < data_02186ae8.count; i++, object++) {
        if (!object->busy && !object->flags.disabled && object->flags.active && object->flags.ready && object->status.bits.pending) {
            Entry *base = object->entries;
            entry = &base[object->index];
            key = object->key;


            func_02092904(entry->source, entry->size);
            func_02090114();
            func_020900a0(entry->source, key, entry->size);
            func_02090048();
            node = (Node_0200fa90 *)func_0200fdc0((Arg0200fdc0 *)entry);
            node->key = (node->key & 0xfff) | (key << 12);
            entry->key = key;
            if (!node->prev) tail = 0;
            else {
                tail = node;
                while (tail->prev) tail = tail->prev;
            }
            List_Unlink((list_node_t *)node);
            func_0200fa90(node, tail);
            object->status.value &= ~0x8000000;
            return 1;
        }
    }
    return 0;
}


