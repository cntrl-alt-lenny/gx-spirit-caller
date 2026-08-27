/* func_0206e6ac: on a non-zero func_0206e1b0(p) result, byte-swap it into
 * *out and report success. */

extern int func_0206e1b0(void *p);

int func_0206e6ac(void *p, int *out) {
    unsigned int v = func_0206e1b0(p);
    if (v == 0) {
        return 0;
    }
    *out = ((v >> 24) & 0x000000FF) | ((v >> 8) & 0x0000FF00) |
           ((v << 8) & 0x00FF0000) | ((v << 24) & 0xFF000000);
    return 1;
}
