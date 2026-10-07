/* func_0207db00: round [start, start + len) inward to 4 bytes; when at least
 * 0x30 bytes remain, hand the range (and arg) to func_0207dc5c, else return 0. */
extern void *func_0207dc5c(unsigned int start, unsigned int end, unsigned short arg);

void *func_0207db00(unsigned int start, unsigned int len, unsigned short arg) {
    unsigned int end = (len + start) & ~3u;
    unsigned int s = (start + 3) & ~3u;
    if (s > end || end - s < 0x30) {
        return 0;
    }
    return func_0207dc5c(s, end, arg);
}
