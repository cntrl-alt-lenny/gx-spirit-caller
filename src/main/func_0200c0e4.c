typedef struct Node_0200fa90 Node_0200fa90;
struct Node_0200fa90 { Node_0200fa90 *next, *prev; int f8; unsigned int key; };
typedef struct list_node { struct list_node *prev, *next; } list_node_t;
typedef struct Node_0200fc78 Node_0200fc78;
struct Node_0200fc78 { Node_0200fc78 *next; int f4; int f8; unsigned int key; };
typedef struct { signed char type; char pad[0x17]; int f18; } Query_0200fc78;
extern Node_0200fa90 *func_0200fa90(Node_0200fa90 *, Node_0200fa90 *);
extern int List_Unlink(list_node_t *);
extern Node_0200fc78 *func_0200fc78(Query_0200fc78 *);
extern void func_0209015c(void);
extern void func_02090330(void);
extern void func_020901cc(const void *, unsigned int, unsigned int);
extern void func_02092904(const void *, unsigned int);
typedef struct { signed char type; char pad[7]; const void *source; unsigned int size; const void *source2; unsigned int size2; unsigned int key; int unused; } Entry;
typedef struct {
    char pad0[0x18]; Entry *entries;
    char pad1c[0x44];
    struct { unsigned int active:1; unsigned int disabled:1; unsigned int ready:1; unsigned int rest:29; } flags;
    char pad64[0x18];
    union { unsigned int value; struct { unsigned int low:26; unsigned int pending:1; unsigned int high:5; } bits; } status;
    char pad80[0x1dc]; unsigned int key; int index;
    char pad264[0x18]; int busy; int end;
} Object;
extern struct { char pad[0xc]; int count; int unused; Object *objects; } data_02186ae8;
int func_0200c0e4(void) {
    unsigned int key;
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
            func_02090330();
            func_020901cc(entry->source, key, entry->size);
            if (entry->type == 5) {
                func_020901cc(entry->source2, (key >> 1) + 0x20000, entry->size2);
            }
            func_0209015c();
            node = (Node_0200fa90 *)func_0200fc78((Query_0200fc78 *)entry);
            node->key = (node->key & 0xfff) | (key << 12);
            entry->key = key;
            if (!node->prev) tail = 0;
            else {
                tail = node;
                while (tail->prev) tail = tail->prev;
            }
            List_Unlink((list_node_t *)node);
            func_0200fa90(node, tail);
            object->status.value &= ~0x4000000;
            return 1;
        }
    }
    return 0;
}
