/* func_ov000_021ac9cc: if a deferred handle is live, flush it and clear the
 * (handle, aux) slots. */
extern void func_0201eee8(int a, void *b, void *c);
int func_ov000_021ac9cc(int *obj) {
    if (obj[26] == 0)
        return obj[26];
    func_0201eee8(obj[0], obj + 2, obj + 26);
    obj[27] = 0;
    obj[26] = 0;
    return 0;
}
