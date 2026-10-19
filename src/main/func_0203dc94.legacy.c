typedef struct {
    char pad[0x10];
    int f10;
    unsigned char f14, f15, f16;
} Obj;

int func_0203dc94(Obj *p)
{
    int result;
    if (p->f16 < 10) {
        if (p->f14 == 3) result = -51100 - p->f15;
        else if (p->f14 == 4) result = -51200 - p->f15;
        else result = -51300 - p->f15;
    } else if (p->f16 < 13) {
        result = -52000 - p->f15;
    } else {
        result = p->f10;
        if (result == 0) result = -50000 - p->f15;
        else if (result == -1) result = -52100 - p->f15;
        else if (result == -2) result = -52200 - p->f15;
        else if (result == -3) result = -52300 - p->f15;
        else if (result == -4) result = -53000 - p->f15;
        else if (result == -5) result = -53100 - p->f15;
        else if (result == -6) result = -53200 - p->f15;
    }
    return result;
}
