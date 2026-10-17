struct Ov002Card { unsigned short id; unsigned short player : 1; unsigned short kind : 5; unsigned short : 10; };

extern char data_ov002_022cf288[];
extern int func_ov002_021bc618(int a);
extern int func_ov002_021bd030(int a);

int func_ov002_021ff5e4(struct Ov002Card *arg0) {
    if ((*(unsigned int *)(data_ov002_022cf288 + (arg0->player & 1) * 0x868) >> 17) & 1) {
        return 0;
    }
    if (func_ov002_021bc618(arg0->player) == 0) {
        return 0;
    }
    if (arg0->kind > 10) {
        if (func_ov002_021bd030(arg0->player) < 0) {
            return 0;
        }
    }
    return 1;
}
