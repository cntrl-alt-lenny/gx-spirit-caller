typedef unsigned short u16;
typedef unsigned int u32;
typedef struct Rng { u16 lo; u16 hi; u32 pad; struct Rng *next; } Rng;
typedef struct Tab { int pad[4]; Rng *head; } Tab;
typedef struct Obj { Tab *tab; } Obj;

extern u16 func_020801ac(Rng *r, u32 key);

u16 func_02080114(Obj *o, u32 key)
{
    Rng *r = o->tab->head;
    while (r != 0) {
        if (r->lo <= key && key <= r->hi) {
            return func_020801ac(r, key);
        }
        r = r->next;
    }
    return 0xffff;
}
