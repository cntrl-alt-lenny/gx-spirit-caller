extern int Task_PostLocked(void *arg0, int arg1, int arg2);
/* Assembly implementation uses three argument registers despite its void definition. */
extern void Fill32(int value, void *dest, int size);

typedef struct { int value; int unused; char *a; char *b; } Item;
typedef struct { int value; unsigned short a, b; Item **items; } Entry;
typedef struct { int count; Entry **entries; } Result;
typedef struct { int value; unsigned short a, b; int offset; } DiskEntry;
typedef struct { int value; int unused; int a, b; } DiskItem;
typedef struct { char pad[0x18]; int count; int offset; } Header;

Result *func_0200b614(Header *src)
{
    Result *out = (Result *)Task_PostLocked((void *)8, 4, 0);
    int count;
    int i, j;
    DiskItem *items;
    DiskEntry *entry;
    if (out) {
        Fill32(0, out, 8);
        count = src->count;
        out->count = count;
        out->entries = (Entry **)Task_PostLocked((void *)(count * 4), 4, 0);
        if (!out->entries) goto fail;
        for (i = 0; i < count; i++) {
            out->entries[i] = (Entry *)Task_PostLocked((void *)12, 4, 0);
            if (!out->entries[i]) goto fail;
            out->entries[i]->items = (Item **)Task_PostLocked((void *)20, 4, 0);
            if (!out->entries[i]->items) goto fail;
            for (j = 0; j < 5; j++) {
                out->entries[i]->items[j] = (Item *)Task_PostLocked((void *)16, 4, 0);
                if (!out->entries[i]->items[j]) goto fail;
            }
        }
        entry = (DiskEntry *)((char *)src + src->offset);
        for (i = 0; i < count; i++, entry++) {
            items = (DiskItem *)((char *)src + entry->offset);
            out->entries[i]->value = entry->value;
            out->entries[i]->a = entry->a;
            out->entries[i]->b = entry->b;
            for (j = 0; j < 5; j++) {
                out->entries[i]->items[j]->value = items[j].value;
                out->entries[i]->items[j]->a = (char *)src + items[j].a;
                out->entries[i]->items[j]->b = (char *)src + items[j].b;
            }
        }
    }
    return out;
fail:
    return 0;
}


