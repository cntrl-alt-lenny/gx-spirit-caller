extern char data_ov002_022ce288[];

int func_ov002_021fbf30(int val)
{
    int i = 0;
    char *p = data_ov002_022ce288;
    unsigned int count = *(unsigned int *)(p + 0x490);

    for (; i < count; i++) {
        unsigned short h = *(unsigned short *)(p + 4);
        if (val == (int)(((unsigned)h << 17) >> 23))
            return 1;
        p += 0x18;
    }
    return 0;
}
