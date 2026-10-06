extern unsigned short data_02101ec4[2];
extern int func_02076cc0(void *a, int b, int c, unsigned short port);
unsigned short func_02076c5c(void *a, int b, int c)
{
    unsigned int i;
    for (i = 0; i < 2; i++) {
        if (func_02076cc0(a, b, c, data_02101ec4[i])) return data_02101ec4[i];
    }
    return 0;
}
