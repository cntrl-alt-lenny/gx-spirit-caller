/* func_02027ed4: clear bit 4 in `p->f_de` (u16). */
void func_02027ed4(void *p) {
    unsigned short *f = (unsigned short *)((char *)p + 0xde);
    *f &= ~0x10;
}
