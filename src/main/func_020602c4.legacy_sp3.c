extern char data_02101244[], data_02101254[], data_02101260[], data_021012fc[], data_0210130c[];
extern void func_020a6d54(int a, int b, int c, int d);
extern int func_020aaddc(const char *s);
extern unsigned char *func_020ab0c4(unsigned char *haystack, const unsigned char *needle);

int func_020602c4(char *line, char *key, char *out, int size) {
    int delimiter;
    char *start;
    int i;
    int c;
    if (line == 0) func_020a6d54((int)data_021012fc, (int)data_02101244, 0, 0x10d);
    if (key == 0) func_020a6d54((int)data_02101254, (int)data_02101244, 0, 0x10e);
    if (out == 0) func_020a6d54((int)data_02101260, (int)data_02101244, 0, 0x10f);
    if (size <= 0) func_020a6d54((int)data_0210130c, (int)data_02101244, 0, 0x110);
    delimiter = *key;
    start = (char *)func_020ab0c4((unsigned char *)line, (const unsigned char *)key);
    if (start == 0) return 0;
    start += func_020aaddc(key);
    size--;
    i = 0;
    while (i < size && (c = start[i]) != 0 && c != delimiter) {
        out[i] = c;
        i++;
    }
    out[i] = 0;
    return 1;
}



