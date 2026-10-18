typedef struct {
    int pad[7];
    int slots[3];
    int pad2[5];
    int count;
} Sel;

void func_ov002_022ae744(Sel *p, int mask)
{
    int i;
    int n;
    n = 0;
    i = n;
    p->count = 0;
    while (i < 11 && n < 3) {
        if (mask & (1 << i)) {
            p->slots[n] = i;
            n++;
            p->count++;
        }
        i++;
    }
    while (n < 3) {
        int k = n;
        n++;
        p->slots[k] = -1;
    }
}
