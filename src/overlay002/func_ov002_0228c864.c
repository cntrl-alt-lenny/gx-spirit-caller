/* func_ov002_0228c864: collect the set bits (j=0..10) of `mask` at shift
 * base arg0*16 into a local index buffer, Fisher-Yates shuffle it, then
 * pick the buf[j] that maximizes callback(arg0, buf[j]) (first-found max
 * wins ties, randomized by the prior shuffle). Returns -1 if no bits set. */
extern unsigned int func_ov002_021b00d0(unsigned int x);

int func_ov002_0228c864(int arg0, unsigned int mask, int (*callback)(int, int)) {
    int buf[11];
    int i;
    int best;
    int max_val;
    int val;
    int score;
    int count = 0;
    int j = 0;
    int shift = arg0 * 16;

    for (; j <= 10; j++, shift++) {
        if (mask & (1u << shift)) {
            buf[count] = j;
            count++;
        }
    }

    for (i = count - 1; i > 0; i--) {
        int r = (int)func_ov002_021b00d0((unsigned int)(i + 1));
        int t = buf[i];
        buf[i] = buf[r];
        buf[r] = t;
    }

    best = -1;
    max_val = 0;
    for (i = 0; i < count; i++) {
        val = buf[i];
        score = callback(arg0, val);
        if (score > max_val) {
            max_val = score;
            best = val;
        }
    }
    return best;
}
