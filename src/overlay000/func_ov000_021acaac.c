/* func_ov000_021acaac: if a deferred handle is live, flush it and clear the
 * (handle, aux) slots. */
extern void func_0201ef3c(int a, void *b, void *c);
int func_ov000_021acaac(int *obj) {
    if (obj[26] == 0)
        return obj[26];
    func_0201ef3c(obj[0], obj + 2, obj + 26);
    obj[27] = 0;
    obj[26] = 0;
    return 0;
}
