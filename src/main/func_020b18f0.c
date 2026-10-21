extern unsigned char data_020c3654[];

int func_020b18f0(const unsigned char *s1, const unsigned char *s2)
{
    unsigned char c1, c2;
    do {
        int a = *s1++;
        int b;
        c1 = (a < 0 || a >= 0x80) ? a : data_020c3654[a];
        b = *s2++;
        c2 = (b < 0 || b >= 0x80) ? b : data_020c3654[b];
        if (c1 < c2) return -1;
        if (c1 > c2) return 1;
    } while (c1 != 0);
    return 0;
}
