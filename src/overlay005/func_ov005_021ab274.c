typedef struct { int key, prev, next, used, f10, f14, f18; } Entry;
typedef struct { int f0; int *info; Entry *entries; } State;
int func_ov005_021ab274(State *o, int idx, Entry **out) {
    Entry *p = o->entries + idx;
    Entry *base = o->entries;
    int *info = o->info;
    int end;
    if (p->used == 0) return 0;
    end = info[1];
    do {
        if (p->key == end) p = base;
        else p++;
    } while (p->prev != idx && p->key != idx);
    out[0] = p;
    out[1] = o->entries + p->next;
    return p->key;
}

