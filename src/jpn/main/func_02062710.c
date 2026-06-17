/* func_02062710: minimal pass-through thunk to func_02062254. */

extern void func_02062254(void *p);

void func_02062710(void *p) {
    func_02062254(p);
}
