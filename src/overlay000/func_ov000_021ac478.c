extern void Fill32(unsigned int value, void *dest, int size_bytes);
typedef struct {
    unsigned active : 1;
    unsigned enabled : 1;
    unsigned pad : 5;
    unsigned x : 9;
    unsigned y : 9;
    unsigned pad2 : 7;
    unsigned a : 8;
    unsigned b : 8;
    unsigned pad3 : 16;
    unsigned rest[3];
} State;
void func_ov000_021ac478(State *p, unsigned x, unsigned y, unsigned a, unsigned b) {
    Fill32(0, p, 0x14);
    unsigned char a8 = a, b8 = b;
    p->x = x;
    p->y = y;
    p->a = a8;
    p->b = b8;
    p->active = 1;
    p->enabled = 1;
}

