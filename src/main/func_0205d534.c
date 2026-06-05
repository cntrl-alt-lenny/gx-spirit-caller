/* func_0205d534: dedup probe — p = a1->f8; if p && *a2 == *p, link a2->f4 = a1
 * and return 0; else return 1. (a0 is unused — tested value is the 2nd/3rd arg.) */
int func_0205d534(int a0, int *a1, int *a2){
    int *p = (int *)a1[2];
    if (p && *a2 == *p) { a2[1] = (int)a1; return 0; }
    return 1;
}
