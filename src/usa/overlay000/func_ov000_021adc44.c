/* func_ov000_021adc44: (a2>>1) - (a1 * 021ac7dc(a0) >> 2). */
extern int func_ov000_021ac6fc(int a);
int func_ov000_021adc44(int a0, int a1, int a2) {
    return (a2 >> 1) - (a1 * func_ov000_021ac6fc(a0) >> 2);
}
