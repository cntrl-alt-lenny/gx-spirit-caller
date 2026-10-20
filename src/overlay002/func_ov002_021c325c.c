typedef unsigned int u32;
typedef struct { u32 id : 13; u32 rest : 19; } Entry;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern int func_0202e234(int x);

int func_ov002_021c325c(int self) {
    int off = (self & 1) * 0x868;
    u32 n = *(u32 *)(data_ov002_022cf180 + off);
    u32 i;
    int count;
    Entry *p;
    char *row;
    i = 0;
    count = i;
    if (i < n) {
        row = data_ov002_022cf16c + off;
        p = (Entry *)(row + 0x418);
        do {
            if (func_0202e234(p->id) != 0) count++;
            i++;
            p++;
        } while (i < *(u32 *)(row + 0x14));
    }
    return count;
}
