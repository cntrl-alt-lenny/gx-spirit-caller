/* func_02053748: validated bitfield insert — reject if a1 has bits outside the
 * a3 mask; else *a0 = (*a0 & ~(a3<<a2)) | (a1<<a2); return 1. Legacy 1.2/sp2p3. */
int func_02053748(int *a0, int a1, int a2, int a3){
    if (a1 & ~a3) return 0;
    *a0 = (*a0 & ~(a3 << a2)) | (a1 << a2);
    return 1;
}
