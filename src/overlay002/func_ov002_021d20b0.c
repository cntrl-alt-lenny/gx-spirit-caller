extern char data_ov002_022ce950[];
extern char data_ov002_022cf178[];
extern long long func_020b3a7c(unsigned int, unsigned int);
extern int func_ov002_0229ade0(int cmd, int a, int b, int c);

void func_ov002_021d20b0(void)
{
    int side = (*(unsigned short *)data_ov002_022ce950 & 0x8000) ? 1 : 0;
    unsigned int cnt = *(unsigned int *)(data_ov002_022cf178 + (side & 1) * 0x868);
    if (cnt < 2) {
        *(int *)(data_ov002_022ce950 + 0x80c) = 0;
        return;
    }
    {
        unsigned int t = *(unsigned int *)(data_ov002_022ce950 + 0x810);
        if (t > 0x20) {
            *(int *)(data_ov002_022ce950 + 0x80c) = 0;
            return;
        }
        *(unsigned int *)(data_ov002_022ce950 + 0x810) = t + 1;
        {
            long long r = func_020b3a7c(t >> 1, cnt);
            func_ov002_0229ade0(7, side, 0xb, (int)(r >> 32));
        }
    }
}
