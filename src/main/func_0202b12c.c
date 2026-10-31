extern int func_02098038(void *obj, const char *name);
struct Settings { unsigned int pad; unsigned int language:3; unsigned int rest:29; };
extern const struct Settings data_02104f4c;
extern const char *data_020be77c[];

int func_0202b12c(void *obj, const char *src) {
    char buf[32];
    int i = 0;
    if (src[0] != 0) {
        char *dst = buf;
        do {
            *dst = src[i++];
            if (*dst == '#')
                *dst = *data_020be77c[data_02104f4c.language];
            dst++;
        } while (src[i] != 0);
    }
    buf[i] = 0;
    return func_02098038(obj, buf);
}
