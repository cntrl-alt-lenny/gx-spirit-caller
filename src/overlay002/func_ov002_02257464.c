typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u16 id; unsigned short low:6; unsigned short subtype:6; unsigned short type:2; unsigned short high:2; } Query;
typedef struct { u32 id; u32 fields[5]; } Record;
extern Record data_ov002_022c357c[];
extern Record data_ov002_022c08c4[];
extern Record data_ov002_022be1ac[];
extern Record data_ov002_022bf3c4[];
Record *func_ov002_02257464(Query *q) {
    int low = 0;
    int high;
    Record *table;
    u32 id = q->id;
    switch (q->type) {
    case 0: table = data_ov002_022c357c; high = 0x32b; break;
    case 1: table = data_ov002_022c08c4; high = 0x1dc; break;
    case 2:
        if (q->subtype == 0x23) { table = data_ov002_022c357c; high = 0x32b; }
        else { table = data_ov002_022be1ac; high = 0xc0; }
        break;
    case 3: table = data_ov002_022bf3c4; high = 0xdf; break;
    }
    while (low < high) {
        int mid = (low + high) / 2;
        if (table[mid].id < id) low = mid + 1;
        else high = mid;
    }
    if (table[low].id == id) return &table[low];
    return 0;
}
