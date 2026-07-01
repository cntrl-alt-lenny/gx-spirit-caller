extern int data_0218ff8c[];
extern char data_0219060c[];

char *func_0201d0b0(int i)
{
    if (i < 0)
        return (char *)0;
    if (data_0218ff8c[i] != 0)
        goto ok;
    else
        return (char *)0;
ok:
    return data_0219060c + i * 0xc0;
}
