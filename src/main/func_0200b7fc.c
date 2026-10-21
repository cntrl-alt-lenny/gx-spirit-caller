extern void *Task_PostLocked(int size, int align, int flags);
/* Fill32 is assembly with a three argument calling convention. */
extern void Fill32(int value, void *dst, int size);
typedef struct { unsigned short a, b; void *data; } Item;
typedef struct { int kind, value; unsigned short a, b; Item **items; } Entry;
typedef struct { int count; Entry **entries; } List;
typedef struct { char pad[0x18]; int count, offset; } Header;
typedef struct { int kind, value; unsigned short a, b; int offset; } Record;
typedef struct { unsigned short a, b; int offset; } ItemRecord;
List *func_0200b7fc(Header *base)
{
    List *out;
    int count;
    int i, j;
    Record *records;
    ItemRecord *items;
    out = Task_PostLocked(8, 4, 0);
    if (out) {
        Fill32(0, out, 8);
        count = base->count;
        out->count = count;
        out->entries = Task_PostLocked((count * 4), 4, 0);
        if (!out->entries) goto failure;
        for (i = 0; i < count; i++) {
            out->entries[i] = Task_PostLocked(0x10, 4, 0);
            if (!out->entries[i]) goto failure;
            out->entries[i]->items = Task_PostLocked(0x34, 4, 0);
            if (!out->entries[i]->items) goto failure;
            for (j = 0; j < 13; j++) {
                out->entries[i]->items[j] = Task_PostLocked(8, 4, 0);
                if (!out->entries[i]->items[j]) goto failure;
            }
        }
        records = (Record *)((char *)base + base->offset);
        for (i = 0; i < count; i++) {
            items = (ItemRecord *)((char *)base + records[i].offset);
            out->entries[i]->kind = records[i].kind;
            if (records[i].kind) {
                out->entries[i]->value = records[i].value;
                out->entries[i]->a = records[i].a;
                out->entries[i]->b = records[i].b;
                for (j = 0; j < 13; j++) {
                    out->entries[i]->items[j]->a = items[j].a;
                    out->entries[i]->items[j]->b = items[j].b;
                    out->entries[i]->items[j]->data = (char *)base + items[j].offset;
                }
            }
        }
    }
    return out;
failure:
    return 0;
}


