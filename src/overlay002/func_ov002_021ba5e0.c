typedef struct {
    unsigned int id : 13;
    unsigned int rest : 19;
} Entry;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf17c[];
extern int func_0202e234(int x);

int func_ov002_021ba5e0(int idx)
{
    int off = (idx & 1) * 0x868;
    unsigned int i = 0;
    int cnt = 0;
    Entry *p;
    char *base;

    if (i < *(unsigned int *)(data_ov002_022cf17c + off)) {
        base = data_ov002_022cf16c + off;
        p = (Entry *)(base + 0x260);
        do {
            if (func_0202e234(p->id) != 0) {
                cnt++;
            }
            i++;
            p++;
        } while (i < *(unsigned int *)(base + 0x10));
    }
    return cnt;
}
