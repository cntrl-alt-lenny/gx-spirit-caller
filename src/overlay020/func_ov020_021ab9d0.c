typedef struct {
    char pad[0xa98];
    unsigned flag : 1;
} Ov020State;
extern Ov020State data_ov020_021ae060;
extern char data_ov020_021ae0a8[];
extern int func_0207e638(int *o, unsigned a1);
extern void func_ov020_021aa8f0(int a0, int a1, int handle, int *info, int a4, int a5);

void func_ov020_021ab9d0(int a0, int a1) {
    int info[2];
    int handle;
    char *resources = data_ov020_021ae0a8;
    unsigned short idx;
    idx = data_ov020_021ae060.flag == 1 ? 1 : 0;
    info[0] = 0xd8000;
    info[1] = 0;
    handle = func_0207e638(*(int **)(resources + 0x924), idx);
    func_ov020_021aa8f0(a0, a1, handle, info, 0, -1);
}


