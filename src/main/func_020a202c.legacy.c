typedef struct {
    unsigned int start[3];
    unsigned short bound[4];
} Ranges;
typedef struct {
    unsigned int base;
    unsigned int field4;
    unsigned int size;
    unsigned int fieldc;
} Entry;
typedef struct {
    unsigned int header[3];
    Entry entries[3];
} Table;
typedef struct {
    unsigned int base;
    unsigned int size;
    unsigned int address;
    signed char index;
} Output;
typedef struct {
    char pad[0x1318];
    unsigned int scale;
} State;
extern State *data_021a98fc;
int func_020a202c(Output *out, Ranges *ranges, unsigned int value, Table *table)
{
    signed char i;
    unsigned int offset;
    Entry *entry;
    if (value >= ranges->bound[3]) return 0;
    for (i = 2; i >= 0; i--) {
        if (value >= ranges->bound[i]) break;
    }
    if (i < 0) return 0;
    offset = value - ranges->bound[i];
    value = offset * data_021a98fc->scale;
    entry = &table->entries[i];
    out->size = entry->size - value;
    if (out->size > data_021a98fc->scale) out->size = data_021a98fc->scale;
    out->address = value + ranges->start[i];
    out->base = value + entry->base;
    out->index = i;
    return 1;
}


