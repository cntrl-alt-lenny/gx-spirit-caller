struct Ov000Motion {
    char pad[0x80];
    volatile int x;
    volatile int y;
    int startX;
    int startY;
    int deltaX;
    int deltaY;
    int word98;
    unsigned current : 8;
    unsigned target : 8;
    unsigned : 16;
};
void func_ov000_021acdcc(struct Ov000Motion *p, int x, int y, int target)
{
    p->target = (unsigned char)target;
    p->current = 0;
    p->deltaX = x - p->x;
    p->deltaY = y - p->y;
    p->startX = p->x;
    p->startY = p->y;
}

