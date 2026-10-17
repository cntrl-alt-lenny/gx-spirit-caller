extern char data_ov002_022cf16c[];
extern unsigned int func_ov002_021bbeac(int player);

int func_ov002_022047f0(void)
{
    int i;

    for (i = 0; i < 2; i++) {
        unsigned int n = func_ov002_021bbeac(i);
        unsigned int v = *(unsigned int *)(data_ov002_022cf16c + (i & 1) * 0x868 + 0xc);
        v += n;
        if (v >= 6) {
            return 1;
        }
    }
    return 0;
}
