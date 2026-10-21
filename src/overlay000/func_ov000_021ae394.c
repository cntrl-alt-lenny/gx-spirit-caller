typedef struct {
    unsigned int low : 12;
    unsigned int value : 4;
    unsigned int middle : 8;
    unsigned int high : 8;
} Selection;
typedef struct {
    unsigned int low : 9;
    unsigned int mode : 2;
    unsigned int bit11 : 1;
    unsigned int bit12 : 1;
    unsigned int middle : 8;
    unsigned int index : 2;
    unsigned int high : 9;
} Flags;
typedef struct {
    char pad0[0x184];
    int x;
    int y;
    char pad1[0x100];
    int a;
    int b;
    char pad2[0x10];
    unsigned int flags;
    Selection selection;
} State;
typedef struct { short x, y, c, d; } Entry;
extern State data_ov000_021c758c;
typedef struct { Entry header; Entry entries[4]; } Table;
extern Table data_ov000_021b56b4[];
void func_ov000_021ae394(unsigned int index, int a, int b, unsigned int mode) {
    Entry *entries = data_ov000_021b56b4[index].entries;
    data_ov000_021c758c.selection.high = 1;
    data_ov000_021c758c.flags &= ~0x1000;
    data_ov000_021c758c.flags = (data_ov000_021c758c.flags & ~0x600000) | ((index & 3) << 21);
    data_ov000_021c758c.a = a;
    data_ov000_021c758c.b = b;
    data_ov000_021c758c.selection.value = 1;
    data_ov000_021c758c.x = (entries + data_ov000_021c758c.selection.value)[-1].x << 12;
    data_ov000_021c758c.y = ((entries + data_ov000_021c758c.selection.value)[-1].y - 1) << 12;
    data_ov000_021c758c.flags = (data_ov000_021c758c.flags & ~0x600) | ((mode & 3) << 9);
}




