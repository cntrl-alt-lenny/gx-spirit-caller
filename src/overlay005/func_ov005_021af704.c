extern int func_020aaddc(const char *s);
int func_ov005_021af704(unsigned char *p, int count)
{
    int length = func_020aaddc((const char *)p + 0x48);
    int sum = 0;
    int i;
    if (count > length)
        count = length;
    for (i = 0; i < count; i++)
        sum += p[0x68 + i];
    return sum;
}
