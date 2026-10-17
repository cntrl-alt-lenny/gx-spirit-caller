extern int func_0202b890(int id);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];

typedef struct {
    unsigned int id : 13;
    unsigned int rest : 19;
} Slot;

int func_ov002_021bd3e0(int player, int target)
{
    unsigned int i;
    int count;
    int off = (player & 1) * 0x868;
    Slot *p;
    char *base;

    i = count = 0;
    if (i < *(unsigned int *)(data_ov002_022cf180 + off)) {
        base = data_ov002_022cf16c + off;
        p = (Slot *)(base + 0x18 + 0x400);
        do {
            if (target == func_0202b890(p->id)) {
                count++;
            }
            i++;
            p++;
        } while (i < *(unsigned int *)(base + 0x14));
    }
    return count;
}
