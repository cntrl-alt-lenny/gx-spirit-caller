/* func_0203402c: inclusive range test [50000,50099]. Recipe: the orig keeps
 * the tested value in r1 (cmp r1,r0) -> it is the SECOND parameter; the unused
 * first arg keeps the const-pool base in r0 (load 50000 once, add #99). */
int func_0203402c(int a0, int a1) {
    if (a1 >= 50000 && a1 <= 50099) return 1;
    return 0;
}
