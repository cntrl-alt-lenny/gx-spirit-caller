/* func_02088ffc: clear int at offset 0x8c of 3rd arg. */

void func_02088ffc(int unused_a, int unused_b, void *p) {
    *(int *)((char *)p + 0x8c) = 0;
}
