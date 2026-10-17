extern unsigned int data_021a4854;

int func_02087348(void)
{
    int i;
    unsigned int bit = 1;
    for (i = 0; i < 8; i++) {
        if (!(data_021a4854 & bit)) {
            data_021a4854 |= bit;
            return i;
        }
        bit <<= 1;
    }
    return -1;
}
