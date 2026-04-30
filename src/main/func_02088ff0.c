/* func_02088ff0: clear int at offset 0x84 of 3rd arg. */

void func_02088ff0(int unused_a, int unused_b, void *p) {
    *(int *)((char *)p + 0x84) = 0;
}
