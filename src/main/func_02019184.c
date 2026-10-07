typedef struct {
    char pad[0x8];
    int field8;
    char pad2[0x18 - 0xc];
} Elem;

struct Low4 { unsigned int b : 4; };
struct Low8 { unsigned int b : 8; };

extern char *GetSystemWork(void);
extern int func_02019210(int);

unsigned int func_02019184(int arg0) {
    char *sw = GetSystemWork();
    int idx = func_02019210(arg0) - 1;
    Elem *e = (Elem *)(sw + idx * 0x18);

    if (arg0 != 0) {
        return ((struct Low8 *)&e->field8)->b;
    }
    return ((struct Low4 *)(sw + 0x8d0))->b;
}
