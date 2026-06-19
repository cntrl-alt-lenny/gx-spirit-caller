/* func_ov002_02244edc: sibling of 022447d4 (different helper). */
struct F02244fc4Pool {
    int f0;
    int f4;
    char pad[0x18];
    int f20;
};

extern struct F02244fc4Pool data_ov002_022cd314;
extern int func_ov002_0223dbd0(int r0, int a, int b);

int func_ov002_02244edc(int arg) {
    func_ov002_0223dbd0(arg, data_ov002_022cd314.f4, data_ov002_022cd314.f20);
    return 1;
}
