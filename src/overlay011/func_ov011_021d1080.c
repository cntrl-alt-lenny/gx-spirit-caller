extern unsigned int func_ov011_021d0ffc(int arg0);
extern char data_ov011_021d4660[];
extern char data_ov011_021d403c[];
extern char data_ov011_021d334a[];
typedef struct { int x, y; char pad[0x20]; } Entry;
void func_ov011_021d1080(int id, int *outX, int *outY) {
    char *table = data_ov011_021d4660;
    char *state = data_ov011_021d403c;
    if (func_ov011_021d0ffc(id) == 1) {
        int mode = *(int *)(state + 0x268);
        int idx = (int)((unsigned)(mode << 23) >> 28) - 1;
        char *base = data_ov011_021d334a + idx * 0x72;
        char *p = base + (id - 0x11) * 4;
        *outX = *(unsigned short *)(p + 0x2a) << 12;
        *outY = *(unsigned short *)(p + 0x2c) << 12;
    } else {
        Entry *e = (Entry *)table;
        *outX = e[id].x;
        *outY = e[id].y;
    }
}
