typedef struct {
    unsigned short pad;
    unsigned short flag : 1;
} S;
typedef struct {
    int value;
    unsigned char pad[0x864];
} E;
extern void func_ov002_0220eb00(S *self, int *values);
extern E data_ov002_022cf16c[];
int func_ov002_02288350(S *self)
{
    int values[2];
    int index;
    int value;
    int total;
    func_ov002_0220eb00(self, values);
    index = 1 - self->flag;
    value = values[index];
    if (value <= -1000)
        return 1;
    total = data_ov002_022cf16c[index & 1].value;
    total += value;
    return total <= 0;
}
