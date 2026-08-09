/* func_020a68a0: byte-at-a-time table-driven checksum/hash update --
 * state = table[state ^ *data++] for each of `len` bytes, then stores
 * the final state back through *state_ptr.
 */
void func_020a68a0(unsigned char *table, unsigned char *state_ptr, unsigned char *data, unsigned int len) {
    unsigned char s = *state_ptr;
    unsigned int i;

    for (i = 0; i < len; i++) {
        s = table[(unsigned char)(s ^ *data)];
        data++;
    }

    *state_ptr = s;
}
