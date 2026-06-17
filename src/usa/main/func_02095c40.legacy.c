/* func_02095c40: StyleA 928cc-family -> helper(g+4, 4); return *(int)(g+4). */
extern int func_020927e4(int p, int k);
extern char *data_021a81a0;
int func_02095c40(void) {
    func_020927e4((int)(data_021a81a0 + 4), 4);
    return *(int *)(data_021a81a0 + 4);
}
