/* func_020606b4: repeatedly locate a 7-byte-separated chunk via
 * func_02060b9c, XOR-decrypt each chunk (resetting the cipher key
 * pointer to data_0210127c beforehand) and hand it to func_0206073c,
 * then return the total number of bytes consumed.
 */

extern signed char *data_02101278;
extern signed char data_0210127c[];
extern char *func_02060b9c(char *cur, int remaining);
extern void func_02060d18(signed char *buf, int len);
extern int func_0206073c(char *self, int offset);

int func_020606b4(char *cur, int remaining) {
    int len;
    int total = remaining;
    char *found = func_02060b9c(cur, remaining);
    while (remaining > 0 && found != 0) {
        len = found - cur;
        data_02101278 = data_0210127c;
        func_02060d18((signed char *)cur, len);
        func_0206073c(cur, len);
        remaining -= len + 7;
        cur = found + 7;
        if (remaining > 0) {
            found = func_02060b9c(cur, remaining);
        }
    }
    return total - remaining;
}
