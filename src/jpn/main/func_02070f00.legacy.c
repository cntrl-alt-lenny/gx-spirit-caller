/* func_02070f00: chase global->f4->fa4; if non-null, poke a byte (=10) and
 * clear a word (+0x44). Legacy mwcc 1.2/sp2p3 predicates the two stores
 * (movne/strbne/movne/strne); 2.0 branches -> near-miss. */
extern char data_021a62f0[];

void func_02070f00(void) {
    char *q = *(char **)(data_021a62f0 + 4);
    q = *(char **)(q + 0xa4);
    if (q) {
        *(char *)(q + 8) = 10;
        *(int *)(q + 0x44) = 0;
    }
}
