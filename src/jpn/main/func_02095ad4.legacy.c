/* func_02095ad4: stride-12 table store — TABLE[a0] = {a1, a2}; bump+return the
 * f8 byte. (Count field is UNSIGNED char -> ldrb.) Legacy 1.2/sp2p3. */
extern unsigned char data_021a8140[];
int func_02095ad4(int a0, int a1, int a2){
    unsigned char *e = data_021a8140 + a0 * 12;
    *(int *)e = a1;
    *(int *)(e + 4) = a2;
    e[8]++;
    return e[8];
}
