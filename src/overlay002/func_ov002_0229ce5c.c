extern char *func_0202b7cc(int idx);
extern void func_ov002_0229cdb8(void *self, unsigned int arg1);

void func_ov002_0229ce5c(char *dst, const char *fmt, const char *str)
{
    *dst = 0;
    if (((unsigned int)fmt & 0xfffe0000) == 0)
        fmt = func_0202b7cc((int)fmt);
    if (((unsigned int)str & 0xfffe0000) == 0)
        str = func_0202b7cc((int)str);
    if (fmt == 0) return;
    while (*fmt != 0) {
        if (*fmt == '%' && fmt[1] == 's') {
            *dst = 0;
            func_ov002_0229cdb8(dst, (unsigned int)str);
            func_ov002_0229cdb8(dst, (unsigned int)(fmt + 2));
            return;
        }
        *dst++ = *fmt++;
    }
    *dst = 0;
}
