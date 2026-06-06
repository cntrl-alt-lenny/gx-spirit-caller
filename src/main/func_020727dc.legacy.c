/* func_020727dc: return 1 iff both a0 and a1 are valid handles (!= 0 and != -1).
 * Legacy 1.2/sp2p3 (&&-chain -> shared return-0). */
int func_020727dc(int a0, int a1){
    if (a0 != 0 && a0 != -1 && a1 != 0 && a1 != -1) return 1;
    return 0;
}
