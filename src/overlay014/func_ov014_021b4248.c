typedef struct {
    char pad[0x54];
    unsigned short a : 8;
    unsigned short b : 8;
    unsigned short c : 8;
    unsigned short d : 8;
} SelfT;

unsigned int func_ov014_021b4248(SelfT *self)
{
    unsigned int a = self->a;
    unsigned int b = self->b;
    unsigned int c = self->c;
    unsigned int d = self->d;
    unsigned int result = 0;
    result |= a & 0x1f;
    result |= (b << 27) >> 22;
    result |= (c << 27) >> 17;
    result |= (d << 27) >> 12;
    return result;
}
