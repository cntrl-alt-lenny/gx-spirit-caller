/* func_0206844c: append n to the tail-list in o — link old tail (o->f4) to n,
 * seed head (o->f0) if empty, bump count (o->f8). */
void func_0206844c(int *o, int *n){
    int *t = (int *)o[1];
    if (t) t[8] = (int)n;
    o[1] = (int)n;
    n[8] = 0;
    if (o[0] == 0) o[0] = (int)n;
    o[2]++;
}
