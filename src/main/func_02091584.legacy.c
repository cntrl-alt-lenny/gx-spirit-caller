typedef struct { int used; unsigned char *buf; } Buffer;
void func_02091584(Buffer *p, const char *source, int count) {
    unsigned int i;
    unsigned int clamped;
    if (count <= 0) return;
    clamped = p->used;
    if (clamped > (unsigned int)count) clamped = count;
    for (i = 0; i < clamped; i++) p->buf[i] = source[i];
    p->used -= clamped;
    p->buf += count;
}
