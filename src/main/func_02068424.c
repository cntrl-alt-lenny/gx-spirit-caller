/* func_02068424: singly-linked list push. Chain `n` onto the head at *o,
 * seed the tail pointer (o[1]) if empty, bump the count (o[2]). */
void func_02068424(int *o, int *n) {
    n[8] = o[0];
    o[0] = (int)n;
    if (o[1] == 0) o[1] = (int)n;
    o[2]++;
}
