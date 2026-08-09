/* func_02067a4c — init 5 prime-ish bytes then descending fill.
 * Five immediate byte stores at +0x100..+0x104 (1,3,5,7,0xb), then a
 * loop i in [0,0x100): p[i] = 0xff - i  (r1 starts 0xff, decremented
 * each iteration, stored at p+i). Store the five fields in asm order;
 * the fill is a count-up index with a count-down value.
 */
void func_02067a4c(unsigned char *p) {
    int v;
    int i;

    p[0x100] = 1;
    p[0x101] = 3;
    p[0x102] = 5;
    p[0x103] = 7;
    p[0x104] = 0xb;

    for (i = 0, v = 0xff; i < 0x100; i++) {
        p[i] = v;
        v--;
    }
}
