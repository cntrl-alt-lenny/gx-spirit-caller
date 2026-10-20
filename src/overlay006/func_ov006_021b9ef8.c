/* Fill32 is an assembly implementation with the ABI (value, destination, size). */
extern void Fill32(unsigned int value, void *dest, unsigned int size);
extern unsigned char data_ov006_0225c4dc[];
extern unsigned int data_021040ac[];
/* The original reloads these bytes on each loop iteration. */
extern volatile unsigned char data_02104f54[];

typedef struct Entry {
    int x, y, z;
    int pad[5];
    unsigned int enabled : 1;
    unsigned int other : 31;
} Entry;
typedef struct State {
    int pad0[14];
    int a38, a3c, mode, a44, a48, a4c, a50;
    int pad54[4];
    int a64, a68, a6c, a70, a74;
    int pad78[10];
    Entry entries[5];
} State;
int func_ov006_021b9ef8(State *s, int mode, int flag) {
    volatile unsigned char *bytes;
    int i;
    Entry *entry;
    Fill32(0, data_ov006_0225c4dc, 0x674);
    s->a38 = 0;
    s->a3c = 0;
    if (mode != 1) flag = 0;
    s->mode = mode;
    s->a74 = flag;
    if (flag) {
        s->a64 = data_021040ac[14];
        s->a68 = 0;
        s->a6c = 0xb4;
    }
    s->a48 = 1;
    switch (s->mode) {
    case 2: case 5: case 6:
        s->a4c = 0; s->a50 = 0; break;
    case 3:
        s->a4c = 1; s->a50 = 1; break;
    default:
        s->a4c = 0; s->a50 = 1; break;
    }
    i = 0;
    bytes = data_02104f54;
    entry = s->entries;
    for (; i < 5; i++, entry++) {
        entry->x = 0;
        entry->y = 0;
        entry->z = 0;
        if (s->mode == 5)
            entry->enabled = (bytes[1] & (1 << i)) != 0;
        else if (s->mode == 6)
            entry->enabled = (bytes[2] & (1 << i)) != 0;
        else
            entry->enabled = (bytes[0] & (1 << i)) != 0;
    }
    return 1;
}




