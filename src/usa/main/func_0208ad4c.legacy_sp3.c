/* func_0208ad4c: generic 3-callback vtable dispatcher. vt->+0x8 (pre)
 * and vt->+0x10 (post) are optional (NULL-checked), each taking
 * (p0,p1,p2,p3,extra-arg); vt->+0x4 (main) is mandatory and takes
 * (p0,p1,p2,vt-self). Finishes with 2 fixed calls to func_0209281c. */

typedef void (*PreFn)(int, int, int, int, void *);
typedef void (*MainFn)(int, int, int, void *);
typedef void (*PostFn)(int, int, int, int, void *);

typedef struct {
    char _pad0[0x4];
    MainFn main_fn; /* +0x4 */
    PreFn pre_fn;   /* +0x8 */
    void *pre_arg;  /* +0xc */
    PostFn post_fn; /* +0x10 */
    void *post_arg; /* +0x14 */
} VTable;

extern void func_0209281c(int a, int b);

void func_0208ad4c(int param0, int param1, int param2, int param3, VTable *vt)
{
    if (vt->pre_fn != 0)
        vt->pre_fn(param0, param1, param2, param3, vt->pre_arg);

    vt->main_fn(param0, param1, param2, vt);

    if (vt->post_fn != 0)
        vt->post_fn(param0, param1, param2, param3, vt->post_arg);

    func_0209281c(param0, param2);
    func_0209281c(param1, param2);
}
