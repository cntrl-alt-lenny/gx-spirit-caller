extern char *Strchr(char *s, int c);
extern int func_020ab054(unsigned char *s1, unsigned char *s2, int n);
extern int func_020602c4(char *src, char *key, char *out, int size);
extern int func_020ace00();
extern unsigned char data_021000a4[];
extern char data_021000ac[];
extern char data_021000b0[];
struct Buffer { char *data; int unk4; int size; int used; };
int func_02057844(void *ctx, struct Buffer *buf, char **out, int *value, int *length) {
    char tmp[16];
    char *end;
    int n;
    *out = 0;
    if (buf->size < 5) return 0;
    end = Strchr(buf->data, 10);
    if (end) {
        if (func_020ab054((unsigned char *)(end - 5), data_021000a4, 5) != 0) return 3;
        *end = 0;
        if (func_020602c4(buf->data, data_021000ac, tmp, 16) == 0) return 3;
        *value = func_020ace00(tmp);
        if (func_020602c4(buf->data, data_021000b0, tmp, 16) == 0) return 3;
        n = func_020ace00(tmp);
        if (buf->size > n + 1 + (end - buf->data)) {
            if (end[n + 1] != 0) return 3;
            *out = end + 1;
            *length = n;
            buf->used = n + 1 + (end - buf->data) + 1;
        } else {
            *end = 10;
        }
    }
    return 0;
}


