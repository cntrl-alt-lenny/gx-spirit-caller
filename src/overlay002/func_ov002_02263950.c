typedef struct {
    char pad[0xd28];
    unsigned idx;
} Glob;
extern char data_ov002_022cf16c[];
extern Glob data_ov002_022d016c;
extern int func_ov002_021baca8(int self, int idx, int arg);
extern void func_ov002_021df62c(int self, int idx, int v);
extern void func_ov002_021de940(int self, int idx, int a, int b);

int func_ov002_02263950(int self) {
    unsigned i = data_ov002_022d016c.idx;
    while (i <= 4) {
        if (func_ov002_021baca8(self, i, 0xfbd) != 0) {
            char *s = (char *)((self & 1) * 0x868 + (int)data_ov002_022cf16c);
            char *q = s + 0x30;
            q = q + i * 20;
            unsigned w = *(unsigned *)q;
            func_ov002_021df62c(self, i, ((w << 2) >> 24) * 2 + ((w << 18) >> 31));
            func_ov002_021de940(self, i, 0, 0);
            data_ov002_022d016c.idx++;
            return 0;
        }
        i = data_ov002_022d016c.idx + 1;
        data_ov002_022d016c.idx = i;
    }
    return 1;
}
