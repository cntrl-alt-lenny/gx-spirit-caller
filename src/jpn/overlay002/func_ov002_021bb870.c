extern unsigned char data_ov002_022cf08c[]; /* entry table, stride 20 */
extern int func_ov002_021ba024(int a, int b, int c);

int func_ov002_021bb870(int self, int arg2)
{
    int i;
    int count = 0;
    unsigned char *e = (unsigned char *)data_ov002_022cf08c + (self & 1) * 0x868;

    for (i = 0; i <= 10; i++, e += 20) {
        if (func_ov002_021ba024(self, i, arg2)) {
            if (*(unsigned short *)(e + 0x38))
                count++;
        }
    }
    return count;
}
