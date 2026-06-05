/* func_0206a958: bit-flags -> weight sum. Base 5, +4 per low pair (bits 1,3),
 * +2 per high pair (bits 4,5). Legacy 1.2/sp2p3 (predicated addne chain). */
int func_0206a958(int a0){
    int r = 5;
    if (a0 & 2) r += 4;
    if (a0 & 8) r += 4;
    if (a0 & 16) r += 2;
    if (a0 & 32) r += 2;
    return r;
}
