typedef struct {
    char _pad[0x96c];
    int *handle_src;
} Ov020Globals;

extern Ov020Globals data_ov020_021ae060;
extern int func_0207e638(int *o, unsigned a1);
extern void func_ov020_021aa8f0(int a0, int a1, int handle, int *info, int a4, int a5);

void func_ov020_021ab8f8(int idx, int a1, int a2) {
    int info[2];
    int handle;

    info[0] = 0xb000;
    info[1] = (idx * 0x28 + 0x23) << 0xc;
    handle = func_0207e638(data_ov020_021ae060.handle_src, 2);
    func_ov020_021aa8f0(a1, a2, handle, info, 0, -1);
}
