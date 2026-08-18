/* func_0209dd30: allocate/lookup a record via func_0209dde8(id), tag it
 * with id, then copy `count` trailing words (read past the `count`
 * parameter's own stack slot -- the caller's args beyond arg1) into the
 * record, arm it via func_020928e8/func_02096358, and notify via
 * func_0209256c. Style A (sp2p3): taking &count's address forces the
 * full incoming-register spill.
 */

extern char *func_0209dde8(int key);
extern void func_020928e8(void *rec, int x);
extern int  func_02096358(int a, int b, int c);
extern void func_0209256c(void *a, void *b, int c);
extern int data_021a8d30;

int func_0209dd30(int arg0, unsigned short count, int arg2, int arg3) {
    int *p;
    int i;
    int r;
    char *rec = func_0209dde8(arg0);

    if (rec == 0) {
        return 8;
    }
    *(unsigned short *)rec = (unsigned short)arg0;

    p = (int *)(((int)&count) & ~3) + 1;
    for (i = 0; i < count; i++) {
        p++;
        ((int *)(rec + 4))[i] = p[-1];
    }

    func_020928e8(rec, 0x100);
    r = func_02096358(0xa, (int)rec, 0);
    func_0209256c(&data_021a8d30, rec, 1);
    return (r < 0) ? 8 : 2;
}
