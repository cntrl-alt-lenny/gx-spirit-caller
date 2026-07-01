extern int data_0218feac[];
extern char data_0219052c[];

char *func_0201d05c(int i)
{
    if (i < 0)
        return (char *)0;
    if (data_0218feac[i] != 0)
        goto ok;
    else
        return (char *)0;
ok:
    return data_0219052c + i * 0xc0;
}
