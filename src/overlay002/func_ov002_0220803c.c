typedef unsigned int u32;
typedef struct {
    unsigned short bit0:1;
    unsigned short pad:5;
    unsigned short tag:6;
    unsigned short rest:4;
} Flags;
typedef struct {
    unsigned short pad:6;
    unsigned short value:9;
    unsigned short rest:1;
} Value;
typedef struct { unsigned short id; Flags flags; Value value; } Self;
typedef struct {
    u32 pad:13;
    u32 low:1;
    u32 pad2:8;
    u32 high:8;
    u32 rest:2;
} Entry;
typedef struct { char pad[0xc]; u32 count; char pad2[0x110]; Entry entries[0x1d2]; } Table;
extern Table data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
/* This call passes a side bit in r0, despite the callee defining it as void *. */
extern int func_ov002_022536e8(unsigned int side, int arg1, int arg2);
int func_ov002_0220803c(Self *self, int unused1) {
    u32 i;
    if (self->flags.tag != 0x23) {
        i = 0;
        if (i < *(u32 *)(data_ov002_022cf178 + (self->flags.bit0 & 1U) * 0x868)) do {
            Entry *entry = &data_ov002_022cf16c[self->flags.bit0 & 1].entries[i];
            u32 value = entry->high * 2 + entry->low;
            if (value != self->value.value) {
                if (func_ov002_022536e8(self->flags.bit0, self->id, i) != 0) return 1;
            }
        } while (++i < data_ov002_022cf16c[self->flags.bit0 & 1].count);
        return 0;
    }
    return 1;
}




