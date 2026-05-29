/* func_02095d34: StyleA 928cc-family -> helper(g+4, 4); return *(int)(g+4). */
extern int func_020928cc(int p, int k);
extern char *data_021a8280;
int func_02095d34(void) {
    func_020928cc((int)(data_021a8280 + 4), 4);
    return *(int *)(data_021a8280 + 4);
}
