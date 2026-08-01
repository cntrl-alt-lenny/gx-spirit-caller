typedef struct { int w[3]; } Hdr3_t;
typedef struct { int w[20]; } Tbl20_t;

extern char data_020b59e0[];
extern char data_020b5ab8[];
extern char data_020c5c7c[];
extern char data_020c5c90[];
extern int func_0201a4dc(void);
extern int OS_SPrintf(char *buf, const char *fmt, ...);

void func_0201a778(int a0, char *a1) {
    struct {
        Hdr3_t header;
        Tbl20_t table;
    } local;
    int r7 = func_0201a4dc();

    local.header = *(Hdr3_t *)data_020b59e0;
    local.table = *(Tbl20_t *)(data_020b5ab8 + 0x78);

    if (a0 == 0) {
        OS_SPrintf(a1, data_020c5c7c, local.table.w[a0]);
    } else {
        int idx = (r7 == 3) ? 10 : 0;
        OS_SPrintf(a1, data_020c5c90, local.header.w[r7 - 1], local.table.w[a0 + idx]);
    }
}
