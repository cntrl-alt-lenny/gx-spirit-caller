/* func_02060728: repeatedly locate a 7-byte-separated chunk via
 * func_02060c10, XOR-decrypt each chunk (resetting the cipher key
 * pointer to data_0210135c beforehand) and hand it to func_020607b0,
 * then return the total number of bytes consumed.
 */

extern signed char *data_02101358;
extern signed char data_0210135c[];
extern char *func_02060c10(char *cur, int remaining);
extern void func_02060d8c(signed char *buf, int len);
extern int func_020607b0(char *self, int offset);

int func_02060728(char *cur, int remaining) {
    int len;
    int total = remaining;
    char *found = func_02060c10(cur, remaining);
    while (remaining > 0 && found != 0) {
        len = found - cur;
        data_02101358 = data_0210135c;
        func_02060d8c((signed char *)cur, len);
        func_020607b0(cur, len);
        remaining -= len + 7;
        cur = found + 7;
        if (remaining > 0) {
            found = func_02060c10(cur, remaining);
        }
    }
    return total - remaining;
}
