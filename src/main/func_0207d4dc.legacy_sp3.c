/* func_0207d4dc: round [start, start + len) inward to 4 bytes; when at least
 * 0x4c bytes remain, hand the range (and arg) to func_0207d914, else return 0. */
extern void *func_0207d914(unsigned int start, unsigned int end, int arg);

void *func_0207d4dc(unsigned int start, unsigned int len, int arg) {
    unsigned int end = (len + start) & ~3u;
    unsigned int s = (start + 3) & ~3u;
    if (s > end || end - s < 0x4c) {
        return 0;
    }
    return func_0207d914(s, end, arg);
}
