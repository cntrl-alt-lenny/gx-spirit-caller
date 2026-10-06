typedef struct {
    int id;      /* +0x0 */
    int _f4;
    char *name;  /* +0x8 */
} Request;

extern char data_020ff928[];
extern int func_020aaf40(const char *a, const char *b);
extern void func_02048314(void);
extern void func_02055c70(int a, int id, int b, int c, void (*cb)(void), int d);

int func_02049270(int a, Request *req) {
    if (func_020aaf40(req->name, data_020ff928) != 0) {
        return 0;
    }
    func_02055c70(a, req->id, 0, 0, func_02048314, 0);
    return 1;
}
