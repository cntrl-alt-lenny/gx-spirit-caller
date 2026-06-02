/* func_ov000_021aa898: stash three params into the active object, reset a
 * counter, then kick + refresh it. */
extern void func_ov000_021aa7e0(int a);
extern void func_ov000_021aa5b8(void *obj);
extern char data_ov000_021c73e0[];
void func_ov000_021aa898(int a0, int a1, int a2) {
    int *obj = *(int **)data_ov000_021c73e0;
    obj[9]  = a0;
    obj[10] = a1;
    obj[11] = a2;
    *(short *)((char *)obj + 318) = 0;
    func_ov000_021aa7e0(1);
    func_ov000_021aa5b8(obj);
}
