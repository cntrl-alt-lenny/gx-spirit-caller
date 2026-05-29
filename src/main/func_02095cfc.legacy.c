/* func_02095cfc: StyleA 928cc-family -> helper(g+8, 2); return *(u16)(g+8). */
extern int func_020928cc(int p, int k);
extern char *data_021a8280;
int func_02095cfc(void) {
    func_020928cc((int)(data_021a8280 + 8), 2);
    return *(unsigned short *)(data_021a8280 + 8);
}
