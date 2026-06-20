#pragma thumb on
extern long long func_020b3988(int a, int b);
int func_ov004_021dbf40(int *state) {
    unsigned char *S = (unsigned char *)state[2];
    int mod = state[3];
    int i = (unsigned char)(int)(func_020b3988(state[0] + 1, mod) >> 32);
    unsigned char si = S[i];
    int j = (unsigned char)(int)(func_020b3988(si + state[1], mod) >> 32);
    unsigned char sj = S[j];
    state[0] = i;
    state[1] = j;
    S[j] = si;
    S[i] = sj;
    return S[(int)(func_020b3988(si + sj, state[3]) >> 32)];
}
