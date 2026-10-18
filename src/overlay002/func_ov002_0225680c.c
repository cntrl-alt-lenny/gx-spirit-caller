extern char data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
extern int func_ov002_021baca8(int a, int b, int c);
extern int func_ov002_021de480(int a, int b, int c, int d);

int func_ov002_0225680c(void)
{
    int p;
    int j;
    int i;
    char *q;
    for (i = 0; i < 2; i++) {
        p = *(int *)(data_ov002_022d016c + 0xcec) ^ i;
        q = data_ov002_022cf16c + (p & 1) * 0x868;
        for (j = 0; j <= 4; j++, q += 0x14) {
            if (func_ov002_021baca8(p, j, 0x16bf) != 0 && *(unsigned short *)(q + 0x36) != 0) {
                func_ov002_021de480(p, j, 0, 0);
                return 1;
            }
        }
    }
    return 0;
}
