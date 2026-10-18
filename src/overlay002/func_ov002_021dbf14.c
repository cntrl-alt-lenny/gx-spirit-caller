extern int func_ov002_021dbd48(int a, int b, int c, int d, int e);

unsigned int func_ov002_021dbf14(int a, unsigned int mask, int b, int c)
{
    int i;
    int j;
    unsigned int result;
    int base;

    result = 0;
    i = 0;
    base = 0;
    do {
        for (j = 0; j <= 10; j++) {
            int bit = j + base;
            if (mask & (1 << bit)) {
                if (func_ov002_021dbd48(a, i, j, b, c) != 0) {
                    result |= 1 << bit;
                }
            }
        }
        i++;
        base += 16;
    } while (i < 2);
    return result;
}
