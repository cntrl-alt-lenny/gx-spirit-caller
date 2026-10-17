/* func_02077954: append ", " (when dst is non-empty) and up to n bytes of
 * src to dst, keeping the total length under 0xff, then terminate. */
void func_02077954(char *dst, char *src, int n) {
    char *start = dst;

    if (*dst != 0) {
        while (*++dst != 0) {
        }
        if (dst - start >= 0xff) {
            return;
        }
        *dst++ = ',';
        *dst++ = ' ';
    }
    while (n-- != 0 && dst - start < 0xff) {
        *dst++ = *src++;
    }
    *dst = 0;
}
