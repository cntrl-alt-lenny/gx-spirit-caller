void func_02078ccc(unsigned int *out, unsigned char *in, unsigned int length)
{
    unsigned int i;
    for (i = 0; i < length; i += 4) {
        *out++ = (in[i] << 24) | (in[i+1] << 16) | (in[i+2] << 8) | in[i+3];
    }
}
