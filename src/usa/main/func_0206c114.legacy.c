/* func_0206c114: a1->f4 = a2 ? a0 : 0; a1->f0 = a2; return a0 + func_0206e3f4(a2).
 * STYLE-A epilogue (legacy 1.2/sp2p3). */
extern int func_0206e3f4(int);
int func_0206c114(int a0, int *a1, int a2){
    a1[1] = a2 ? a0 : 0;
    a1[0] = a2;
    return a0 + func_0206e3f4(a2);
}
