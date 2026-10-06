typedef struct {
    void *ctx;
} Ctx_0205bdb8_t;

typedef struct {
    int mode;
    void *field_4;
} Obj_0205bdb8_t;

typedef struct Item Item;
struct Item {
    char _pad0[0x20];
    Item *next;
};

typedef struct {
    char _pad0[0x424];
    Item *items;
} Owner;

extern void func_0205bdb8(Ctx_0205bdb8_t *a0, Obj_0205bdb8_t *a1);

void func_0205bd58(Owner **pp, Item *item) {
    Owner *o = *pp;
    Item *prev = 0;
    Item *n;

    for (n = o->items; n != 0; n = n->next) {
        if (n == item) {
            if (prev == 0) {
                o->items = n->next;
            } else {
                prev->next = item->next;
            }
            func_0205bdb8((Ctx_0205bdb8_t *)pp, (Obj_0205bdb8_t *)item);
            return;
        }
        prev = n;
    }
}
