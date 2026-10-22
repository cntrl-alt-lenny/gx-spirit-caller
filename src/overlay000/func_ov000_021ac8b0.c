struct State { char pad[0x98]; unsigned flags; };
extern void func_ov000_021b0e74_unk(int, char **);
extern void func_ov000_021ac920(struct State *, char **, int);
void func_ov000_021ac8b0(struct State *s, int id, int value)
{
    char *pointers[4];
    char buffers[4][64];
    int i;
    char *p = buffers[0];
    for (i = 0; i < 4; i++) {
        pointers[i] = p;
        pointers[i][0] = 0;
        p += 64;
    }
    func_ov000_021b0e74_unk(id, pointers);
    func_ov000_021ac920(s, pointers, value);
    s->flags |= 0x10000000;
    s->flags = (s->flags & ~0xff) | (unsigned char)id;
}



