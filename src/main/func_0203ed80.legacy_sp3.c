unsigned int func_0203ed80(const unsigned char *p) {
    unsigned int v = 0;

    v |= p[0] << 24;
    v |= p[1] << 16;
    v |= p[2] << 8;
    v |= p[3];
    return ((v >> 24) & 0xff) | ((v >> 8) & 0xff00) | ((v << 8) & 0xff0000) | ((v << 24) & 0xff000000);
}
