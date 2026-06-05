/* func_02044228: printable-char predicate on *a0 — 0 for DEL (0x7f) and NUL,
 * else 1 up to 0xdf. Unsigned compares (movcc/movls). */
int func_02044228(unsigned char *p){
    unsigned c = *p;
    if (c == 0x7f) return 0;
    if (c < 1) return 0;
    return c <= 0xdf ? 1 : 0;
}
