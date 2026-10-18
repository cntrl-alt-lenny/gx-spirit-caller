typedef struct {
    char pad[0xd9c];
    int state;
} Ctx;

extern int data_ov002_022cd744[];
extern char data_ov002_022cf17c[];
extern Ctx data_ov002_022d016c;

extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);

int func_ov002_0226cf50(int idx)
{
    int other;

    if (data_ov002_022cd744[idx] == 1) {
        return 1;
    }
    other = 1 - idx;
    if (*(int *)(data_ov002_022cf17c + (other & 1) * 0x868) == 0) {
        return 1;
    }
    switch (data_ov002_022d016c.state) {
    case 0:
        func_ov002_021ae400(idx, 0xf9);
        data_ov002_022d016c.state++;
        return 0;
    case 1:
        func_ov002_021af9d0(other, 2, -1, 0xd);
        data_ov002_022d016c.state++;
        return 0;
    }
    return 1;
}
