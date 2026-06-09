#pragma thumb on
extern long long func_020b3a7c(int a, int b);
int func_ov004_021dc154(int *state) {
    unsigned char *S = (unsigned char *)state[2];
    int mod = state[3];
    int i = (unsigned char)(int)(func_020b3a7c(state[0] + 1, mod) >> 32);
    unsigned char si = S[i];
    int j = (unsigned char)(int)(func_020b3a7c(si + state[1], mod) >> 32);
    unsigned char sj = S[j];
    state[0] = i;
    state[1] = j;
    S[j] = si;
    S[i] = sj;
    return S[(int)(func_020b3a7c(si + sj, state[3]) >> 32)];
}
