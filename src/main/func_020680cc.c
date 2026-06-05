/* func_020680cc: tear down o — notify func_02054e70(o->f20), mark o->f20 = -1,
 * then func_02068368 on the o+0x14 and o+8 sub-blocks. */
extern void func_02054e70(int);
extern void func_02068368(void *);
void func_020680cc(char *o){
    func_02054e70(*(int *)(o + 0x20));
    *(int *)(o + 0x20) = -1;
    func_02068368(o + 0x14);
    func_02068368(o + 8);
}
