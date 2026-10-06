extern char data_02101314[];
extern char data_0210131c[];
extern char data_02101324[];
extern char data_02101330[];
extern int func_020ab054(void *a, void *h, unsigned int n);
extern int func_020602c4(char *line, char *key, char *out, int size);
extern int func_020ace00(int a0);
extern char *func_020ab0c4(char *haystack, char *needle);
extern void func_020585d4(void *a0, int a1, int a2);

int func_020603cc(char **ctx, char *line, int check) {
    char *st = *ctx;
    char buf[0x10];
    int found;

    if (func_020ab054(line, data_02101314, 7) == 0) {
        if (func_020602c4(line, data_0210131c, buf, 0x10) != 0) {
            *(int *)(st + 0x418) = func_020ace00((int)buf);
        }
        if (func_020602c4(line, data_02101324, st, 0x100) == 0) {
            *st = 0;
        }
        if (check != 0) {
            found = func_020ab0c4(line, data_02101330) != 0 ? 1 : 0;
            func_020585d4(ctx, 4, found ? 1 : 0);
        }
        return 1;
    }
    return 0;
}
