/* func_ov012_021cae64: return the first active entry in the data_ov012_021cc72c
 * table (stride 0x14), as told by func_ov000_021ac6c8. Only one slot is scanned;
 * returns 0 when it is inactive. (ov012_core.h) */
extern int func_ov000_021ac6c8(void *);
extern char data_ov012_021cc72c[];
void *func_ov012_021cae64(void) {
    char *p = data_ov012_021cc72c;
    int i;
    for (i = 0; i < 1; i++) {
        if (func_ov000_021ac6c8(p))
            return p;
        p += 0x14;
    }
    return 0;
}
