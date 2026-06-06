/* func_02052768: func_020aaec0(a0+6, &tbl, 2); a0->f4(u16) = a1; a0->f0 = a2. */
extern char data_020ffa98[];
extern void func_020aaec0(void *, void *, int);
void func_02052768(char *a0, int a1, int a2){
    func_020aaec0(a0 + 6, data_020ffa98, 2);
    *(unsigned short *)(a0 + 4) = a1;
    *(int *)a0 = a2;
}
