/* func_02068058: tear down o — notify func_02054dfc(o->f20), mark o->f20 = -1,
 * then func_020682f4 on the o+0x14 and o+8 sub-blocks. */
extern void func_02054dfc(int);
extern void func_020682f4(void *);
void func_02068058(char *o){
    func_02054dfc(*(int *)(o + 0x20));
    *(int *)(o + 0x20) = -1;
    func_020682f4(o + 0x14);
    func_020682f4(o + 8);
}
