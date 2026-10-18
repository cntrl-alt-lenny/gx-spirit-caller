extern char *func_0202b7cc(int id);
extern void func_ov002_0229cde8(char *dst, int val);
extern void func_ov002_0229cdb8(char *dst, const char *src);

void func_ov002_0229cf10(char *dst, const char *fmt, int val)
{
    *dst = 0;
    if (((unsigned int)fmt & 0xFFFE0000) == 0) {
        fmt = func_0202b7cc((int)fmt);
    }
    while (*fmt != 0) {
        if (*fmt == '%' && fmt[1] == 'd') {
            *dst = 0;
            func_ov002_0229cde8(dst, val);
            func_ov002_0229cdb8(dst, fmt + 2);
            return;
        }
        *dst++ = *fmt++;
    }
    *dst = 0;
}
