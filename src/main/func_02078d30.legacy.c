void func_02078d30(void *a, void *b, int n)
{
    unsigned char *out = a;
    unsigned int *in = b;
    unsigned int i;
    unsigned int count = (unsigned int)n >> 2;
    for (i = 0; i < count; i++) {
        unsigned int word = *in++;
        out[0] = word >> 24; out[1] = word >> 16; out[2] = word >> 8; out[3] = word;
        out += 4;
    }
}
