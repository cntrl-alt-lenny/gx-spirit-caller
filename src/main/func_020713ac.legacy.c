typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct Fragment {
    u32 address;
    u16 count, id, end, length;
    u16 starts[8], ends[8];
    u32 time;
    u8 *payload, *buffer;
} Fragment;
extern Fragment data_0219f538[8];
extern void *(*data_0219eee0)(u32);
extern void (*data_0219ef0c)(void *);
extern unsigned long long func_020930b0(void);
extern void func_02094688(const void *src, void *dst, unsigned int length);
static inline u16 swap16(int x) { return (x >> 8) | (x << 8); }
u8 *func_020713ac(u8 *packet, int *complete)
{
    u16 id;
    u32 offset, header;
    Fragment *empty = 0;
    Fragment *entry;
    u32 address, flags, size, total, last;
    u32 count, end, i, j, covered;
    *complete = 0;
    flags = swap16(*(u16 *)(packet + 6));
    if (!(flags & 0x3fff)) return packet;
    header = (packet[0] & 15) * 4;
    address = (swap16(*(u16 *)(packet + 12)) << 16) | swap16(*(u16 *)(packet + 14));
    id = *(u16 *)(packet + 4);
    for (i = 0, entry = data_0219f538; i < 8; i++, entry++) {
        if (entry->count && entry->address == address && entry->id == id) break;
        if (!entry->count && !empty) empty = entry;
    }
    size = swap16(*(u16 *)(packet + 2)) - header;
    offset = flags & 0x1fff;
    total = size + offset * 8;
    if (i == 8) {
        if (!empty || total > 0x1000) return 0;
        entry = empty;
        empty->buffer = data_0219eee0(header + 0x100e);
        if (!empty->buffer) return 0;
        empty->address = address;
        empty->id = id;
        empty->end = 0;
        empty->time = (u32)(func_020930b0() >> 16);
        empty->payload = empty->buffer + 14 + header;
        func_02094688(packet, empty->buffer + 14, header);
    }
    if (entry->count == 8 || total > 0x1000) {
        entry->count = 0;
        data_0219ef0c(entry->buffer);
        return 0;
    }
    last = offset + ((size + 7) >> 3);
    if (!(flags & 0x2000)) {
        entry->length = total;
        entry->end = last;
    }
    entry->starts[entry->count] = offset;
    entry->ends[entry->count] = last;
    entry->count++;
    func_02094688(packet + header, entry->payload + offset * 8, size);
    end = entry->end;
    if (!end) return 0;
    count = entry->count;
    covered = 0;
    j = 0;
    while (j < count) {
        if (entry->starts[j] <= covered && covered < entry->ends[j]) {
            covered = entry->ends[j];
            j = 0;
        } else j++;
    }
    if (covered < end) return 0;
    packet = entry->buffer + 14;
    *(u16 *)(packet + 2) = swap16((u16)(entry->length + ((packet[0] & 15) * 4)));
    entry->count = 0;
    *complete = 1;
    return packet;
}




