/* func_0209dc3c: allocate/lookup a record via func_0209dcf4(id), tag it
 * with id, then copy `count` trailing words (read past the `count`
 * parameter's own stack slot -- the caller's args beyond arg1) into the
 * record, arm it via func_02092800/func_02096264, and notify via
 * func_02092484. Style A (sp2p3): taking &count's address forces the
 * full incoming-register spill.
 */

extern char *func_0209dcf4(int key);
extern void func_02092800(void *rec, int x);
extern int  func_02096264(int a, int b, int c);
extern void func_02092484(void *a, void *b, int c);
extern int data_021a8c50;

int func_0209dc3c(int arg0, unsigned short count, int arg2, int arg3) {
    int *p;
    int i;
    int r;
    char *rec = func_0209dcf4(arg0);

    if (rec == 0) {
        return 8;
    }
    *(unsigned short *)rec = (unsigned short)arg0;

    p = (int *)(((int)&count) & ~3) + 1;
    for (i = 0; i < count; i++) {
        p++;
        ((int *)(rec + 4))[i] = p[-1];
    }

    func_02092800(rec, 0x100);
    r = func_02096264(0xa, (int)rec, 0);
    func_02092484(&data_021a8c50, rec, 1);
    return (r < 0) ? 8 : 2;
}
