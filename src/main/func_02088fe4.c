/* func_02088fe4: clear int at offset 0x88 of 3rd arg. */

void func_02088fe4(int unused_a, int unused_b, void *p) {
    *(int *)((char *)p + 0x88) = 0;
}
