typedef struct {
    char pad[0x19];
    unsigned char flag;
    char pad2[2];
} Entry_02009a68;

extern Entry_02009a68 data_021064b8[];
extern void func_02009968(int n);

int func_02009a68(int n) {
    Entry_02009a68 *e;

    if (n > 0) {
        e = &data_021064b8[n - 1];
        func_02009968(n);
        if (e->flag == 1) {
            e->flag = 0;
            return 1;
        }
    }
    return 0;
}
