extern char data_02101234[], data_02101244[], data_02101254[], data_02101260[], data_02101270[];
extern void func_020a6d54(int a, int b, int c, int d);
extern void func_0205ffd4(int *a0, int a1, int a2);
extern void func_020585d4(void *a0, int a1, int a2);

int func_02060000(int *ctx, char *text, int *offset, char *key, char *value) {
    int c;
    char *start;
    int n;
    int count;
    if (text == 0) func_020a6d54((int)data_02101234, (int)data_02101244, 0, 0x199);
    if (key == 0) func_020a6d54((int)data_02101254, (int)data_02101244, 0, 0x19a);
    if (value == 0) func_020a6d54((int)data_02101260, (int)data_02101244, 0, 0x19b);
    start = text + *offset;
    if (*start != '\\') {
        func_0205ffd4(ctx, 1, (int)data_02101270);
        func_020585d4(ctx, 3, 1);
        return 3;
    }
    c = start[1];
    text = start + 2;
    n = 0;
    while (c != '\\') {
        if (c == 0) {
            func_0205ffd4(ctx, 1, (int)data_02101270);
            func_020585d4(ctx, 3, 1);
            return 3;
        }
        if (n == 0x1ff) {
            func_0205ffd4(ctx, 1, (int)data_02101270);
            func_020585d4(ctx, 3, 1);
            return 3;
        }
        *key++ = c;
        c = *text++;
        n++;
    }
    *key = 0;
    count = 0;
    while ((c = *text++) != '\\' && c != 0) {
        if (count == 0x1ff) {
            func_0205ffd4(ctx, 1, (int)data_02101270);
            func_020585d4(ctx, 3, 1);
            return 3;
        }
        *value++ = c;
        count++;
    }
    *value = 0;
    *offset += text - start - 1;
    return 0;
}




