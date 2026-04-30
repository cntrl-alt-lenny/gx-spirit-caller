/* func_020318a4: linked-list head init.
 *   p->f_0 = p; p->f_4 = p;             // prev = next = self
 *   p->f_2c = 0xff000000;
 */

void func_020318a4(void *p) {
    *(void **)p           = p;
    *(void **)((char *)p + 0x4)  = p;
    *(int *)((char *)p + 0x2c)  = 0xff000000;
}
