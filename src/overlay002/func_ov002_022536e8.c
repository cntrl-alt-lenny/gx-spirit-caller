typedef unsigned short u16;
typedef void (*Handler)(void *self, int arg1, int arg2);

extern int func_ov002_02253638(u16 a);
extern char data_ov002_022cad38[];  /* raw byte table, stride 8, function ptr at offset 0 of each entry */
extern int data_ov002_022cdc78[];

int func_ov002_022536e8(void *self, int arg1, int arg2)
{
    int idx;
    int old_val;
    int new_val;

    idx = func_ov002_02253638((u16)arg1);
    old_val = data_ov002_022cdc78[0xc / 4];
    if (idx >= 0) {
        Handler fn = *(Handler *)(data_ov002_022cad38 + idx * 8);
        fn(self, arg1, arg2);
    }
    new_val = data_ov002_022cdc78[0xc / 4];
    data_ov002_022cdc78[0xc / 4] = old_val;
    return new_val - old_val;
}
