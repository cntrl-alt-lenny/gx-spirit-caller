/* func_020526f4: func_020aadcc(a0+6, &tbl, 2); a0->f4(u16) = a1; a0->f0 = a2. */
extern char data_020ff9b8[];
extern void func_020aadcc(void *, void *, int);
void func_020526f4(char *a0, int a1, int a2){
    func_020aadcc(a0 + 6, data_020ff9b8, 2);
    *(unsigned short *)(a0 + 4) = a1;
    *(int *)a0 = a2;
}
