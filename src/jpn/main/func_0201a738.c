typedef struct { int w[3]; } Hdr3_t;
typedef struct { int w[20]; } Tbl20_t;

extern char data_020b58ec[];
extern char data_020b59c4[];
extern char data_020c5b9c[];
extern char data_020c5bb0[];
extern int func_0201a4a8(void);
extern int OS_SPrintf(char *buf, const char *fmt, ...);

void func_0201a738(int a0, char *a1) {
    struct {
        Hdr3_t header;
        Tbl20_t table;
    } local;
    int r7 = func_0201a4a8();

    local.header = *(Hdr3_t *)data_020b58ec;
    local.table = *(Tbl20_t *)(data_020b59c4 + 0x78);

    if (a0 == 0) {
        OS_SPrintf(a1, data_020c5b9c, local.table.w[a0]);
    } else {
        int idx = (r7 == 3) ? 10 : 0;
        OS_SPrintf(a1, data_020c5bb0, local.header.w[r7 - 1], local.table.w[a0 + idx]);
    }
}
