typedef struct {
    char _pad_00[0x2c];
    int pos;
} strm_t;

extern int func_02091678(void);
extern unsigned int func_020931e8(void);
extern unsigned int func_0209361c(void);
extern int func_02038984(int *pos, void *buf, int len, int flag);

int func_02038ad4(strm_t *strm, void *buf, int len) {
    int pos;
    int wrap;
    int n;
    int flag = 1;

    if (!func_02091678() || !func_020931e8() || !func_0209361c()) {
        flag = 0;
    }

    pos = strm->pos;
    wrap = pos & 0x1ff;
    if (wrap != 0) {
        wrap = 0x200 - wrap;
        if (len <= wrap) {
            return func_02038984(&pos, buf, len, flag);
        }
        n = func_02038984(&pos, buf, wrap, flag);
        if (wrap != n) {
            return wrap;
        }
        pos = pos + wrap;
        buf = (char *)buf + wrap;
        len = len - wrap;
    }
    return wrap + func_02038984(&pos, buf, len, flag);
}
