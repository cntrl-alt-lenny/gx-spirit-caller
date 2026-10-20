typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { int ptr; int other; } Pair;
typedef struct { u16 count, flags; int f4, f8; Pair *items; } Entry;
typedef struct { u16 count, flags; int f4, f8, fc, f10, f14; } Header;
typedef struct { u16 count, flags; int data; int *items; } SubEntry;
typedef struct { u16 count, flags; SubEntry *entries; } SubHeader;
void func_0207e3d4(Header *h) {
    u16 i, j;
    Entry *entries;
    char *base8, *basec;
    h->f4 += (int)h;
    h->f8 += (int)h;
    h->fc += (int)h;
    entries = (Entry *)h->f4;
    base8 = (char *)h->f8;
    basec = (char *)h->fc;
    for (i=0; i<h->count; i++) {
        
        entries[i].items = (Pair *)(base8 + (int)entries[i].items);
        for (j=0; j<entries[i].count; j++) {
            entries[i].items[j].ptr = (int)(basec + entries[i].items[j].ptr);
        }
    }
    if (h->f14 != 0) {
        u32 a;
        int b;
        SubHeader *s;
        h->f14 += (int)h;
        s = (SubHeader *)(*(int *)&h->f14 + 8);
        s->entries = (SubEntry *)((int)s->entries + (int)s);
        for (a=0; (u32)a<s->count; a++) {
            SubEntry *e = &s->entries[a];

            e->data += (int)s;
            e->items = (int *)((int)e->items + (int)s);
            b = 0;
            if ((u32)b < e->count) {
                u32 offset = 0;
                do {
                    int *items = e->items;
                    b++;
                    *(int *)((char *)items + offset) += (int)s;
                    offset += 4;
                } while ((u32)b < e->count);
            }
        }
    }
}












