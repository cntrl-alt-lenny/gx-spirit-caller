typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u32 unused; u32 address; u32 size; u32 extra; } Entry;
typedef struct { u32 header[3]; Entry entries[3]; } Input;
typedef struct { u32 offsets[3]; u16 counts[4]; } Output;
typedef struct { u8 pad[0x1318]; u32 unit; } State;
extern State *data_021a98fc;
extern u32 func_020b3a7c(u32 numerator, u32 denominator);
extern int func_020a1e68(u32 index, u32 address, u32 size);
int func_020a2100(Output *out, Input *in) {
    u16 *counts = out->counts;
    u32 total = 0;
    u8 i;
    if (in == 0) return 0;
    for (i = 0; i < 3; i++) {
        out->offsets[i] = total;
        total += in->entries[i].size;
    }
    counts[0] = 0;
    for (i = 0; i < 3; i++) {
        Entry *entry = &in->entries[i];
        u32 unit = data_021a98fc->unit;
        u32 size = entry->size;
        u16 next = counts[i] + (u16)func_020b3a7c(size + unit - 1, unit);
        if (func_020a1e68(i, entry->address, size) == 0) return 0;
        if (i < 2) counts[i + 1] = next;
        else out->counts[3] = next;
    }
    return 1;
}
