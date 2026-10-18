typedef unsigned int u32;
struct Row {
    u32 f : 13;
    u32 rest : 19;
    u32 pad[4];
};
extern char data_ov002_022cf16c[];
extern void func_ov002_0227aee0(int a, int b, int *out);
extern void func_ov002_0227af30(int a, int b, int *out);

int func_ov002_02280d18(int a, int b, int c, int d, int e) {
    int buf[11];
    int i;
    int bestv = 99999;
    struct Row *row = (struct Row *)(data_ov002_022cf16c + (b & 1) * 0x868 + 0x30);
    int v;
    int best = -1;
    for (i = 0; i < 5; i++, row++) {
        if (i != c && row->f != 0) {
        v = 0;
        if (a == b) {
            func_ov002_0227aee0(b, i, buf);
        } else {
            func_ov002_0227af30(b, i, buf);
        }
        if (d) {
            v = buf[5];
            if (v < 0) v = 0;
        }
        if (e) {
            if (v <= buf[6]) v = buf[6];
        }
        if (v < bestv) {
            best = i;
            bestv = v;
        }
        }
    }
    return best;
}
