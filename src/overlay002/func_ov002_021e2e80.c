typedef unsigned short u16;
typedef unsigned int u32;
typedef struct Entry {
    u16 id;
    u16 side:1;
    u16 slot:5;
    u16 kind:6;
    u16 flags:2;
    u16 flag14:1;
    u16 pad:1;
    u16 indexbits;
    u16 rest[7];
    u32 value;
} Entry;
extern unsigned char data_ov002_022d016c[];
extern int data_ov002_022cd744[];
typedef struct { Entry entries[48]; int count; u32 pad[3]; u32 count2; } Table;
extern Table data_ov002_022ce288;
extern Entry data_ov002_022ce588[];
extern void func_ov002_021b1570(int a, int b, void *c, int n);
extern int func_ov002_021b97d4(int a, u32 b);
extern int func_ov002_021e2e18(int a);
/* Original call supplies only two arguments to the four-argument thunk. */
extern int func_ov002_0229cd5c();
void func_ov002_021e2e80(int mode, u32 packed, int index, u32 value) {
    int n;
    int i;
    Entry *scan;
    Entry *entry;
    u32 id;
    u16 buf[6];
    u16 side, flag14, flags, slot, kind;
    if ((index >> 1) == 0)
        index = (u16)func_ov002_021b97d4((packed & 0x80000000) >> 31, (u16)packed);
    id = packed & 0xffff;
    if (id == 0) return;
    if (*(int *)(data_ov002_022d016c + 0xd0c) != 0 && data_ov002_022cd744[*(int *)(data_ov002_022d016c + 0xcec)] == 2) {
        buf[0] = mode; buf[1] = packed; buf[2] = (u32)packed >> 16;
        buf[3] = value; buf[4] = value >> 16; buf[5] = index;
        func_ov002_021b1570(20, -1, buf, 12);
        return;
    }
    if (mode != 0) {
        entry = data_ov002_022ce588;
        n = data_ov002_022ce288.count;
        entry += n;
        data_ov002_022ce288.count = n + 1;
    } else {
        scan = data_ov002_022ce288.entries;
        for (i = 0; (u32)i < data_ov002_022ce288.count2; i++, scan++) {
            if (index == ((u32)(scan->indexbits << 17) >> 23) && scan->id == id) {
                if (func_ov002_021e2e18(scan->id) == 0) return;
            }
        }
        entry = &(data_ov002_022ce288.entries)[data_ov002_022ce288.count2];
        ++data_ov002_022ce288.count2;
    }
    func_ov002_0229cd5c((int)entry, 24);
    entry->id = id;
    side = (packed & 0x80000000) >> 31;
    entry->side = side;
    flag14 = (packed & 0x1000000) >> 24;
    flags = (packed & 0xe00000) >> 21;
    slot = (packed & 0x1f0000) >> 16;
    kind = (packed & 0x7e000000) >> 25;
    entry->flag14 = flag14;
    entry->flags = flags;
    entry->slot = slot;
    entry->kind = kind;
    entry->indexbits = (entry->indexbits & 0xffff803f) | ((u32)index << 23 >> 17);
    entry->value = value;
}


















