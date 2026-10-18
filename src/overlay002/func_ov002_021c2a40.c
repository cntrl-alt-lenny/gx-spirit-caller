extern int func_0202e2f8();
extern void func_ov002_021b91c4(void *dst, void *src);
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];

typedef struct {
    unsigned int id : 13;
    unsigned int player : 1;
    unsigned int rest : 18;
} Slot;

void func_ov002_021c2a40(Slot *s)
{
    int off = (s->player & 1) * 0x868;
    int *cnt = (int *)(data_ov002_022cf180 + off);
    char *dst = data_ov002_022cf16c + off + 0x418 + *cnt * 4;

    if (s->id == 0) {
        return;
    }
    if (func_0202e2f8() != 0) {
        return;
    }
    func_ov002_021b91c4(dst, s);
    *(int *)(data_ov002_022cf180 + off) += 1;
}
