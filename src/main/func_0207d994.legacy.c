/* func_0207d994: init the buffer at *a0 — f0(u16)=a1, f2=0, f4 = a0->f4 -
 * (p+16), f8=f12=0; return p. Legacy 1.2/sp2p3. */
char *func_0207d994(int *a0, int a1){
    char *p = (char *)*a0;
    *(unsigned short *)p = a1;
    *(unsigned short *)(p + 2) = 0;
    *(int *)(p + 4) = a0[1] - (int)(p + 16);
    *(int *)(p + 8) = 0;
    *(int *)(p + 12) = 0;
    return p;
}
