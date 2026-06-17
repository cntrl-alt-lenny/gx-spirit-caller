/* func_02095c08: StyleA 928cc-family -> helper(g+8, 2); return *(u16)(g+8). */
extern int func_020927e4(int p, int k);
extern char *data_021a81a0;
int func_02095c08(void) {
    func_020927e4((int)(data_021a81a0 + 8), 2);
    return *(unsigned short *)(data_021a81a0 + 8);
}
