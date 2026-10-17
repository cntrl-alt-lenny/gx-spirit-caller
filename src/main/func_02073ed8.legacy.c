/* func_02073ed8: non-zero when ip is the broadcast or loopback address, or
 * lies on the same network as data_0219ef1c under the mask data_0219eee8. */
extern unsigned int data_0219eee8;
extern unsigned int data_0219ef1c;

int func_02073ed8(unsigned int ip) {
    int same = 1;
    if (ip != 0xffffffff && ip != 0x7f000001) {
        if ((ip & data_0219eee8) != (data_0219ef1c & data_0219eee8)) {
            same = 0;
        }
    }
    return same;
}
