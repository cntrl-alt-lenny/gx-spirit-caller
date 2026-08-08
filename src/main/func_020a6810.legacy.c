/* func_020a6810: byte-at-a-time table-driven CRC-16-style update --
 * state = table[(state ^ *data++) & 0xff] ^ (state >> 8) for each of
 * `len` bytes, then stores the final state back through *state_ptr.
 */
void func_020a6810(unsigned short *table, unsigned short *state_ptr, unsigned char *data, unsigned int len) {
    unsigned int s = *state_ptr;
    unsigned int i;

    for (i = 0; i < len; i++) {
        s = table[(unsigned char)(s ^ *data)] ^ (s >> 8);
        data++;
    }

    *state_ptr = (unsigned short)s;
}
