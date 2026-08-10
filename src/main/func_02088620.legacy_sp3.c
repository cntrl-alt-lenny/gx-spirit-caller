/* func_02088620: message-pump loop on the global data_021a520c queue.
 * Blocking-receive each message (a dispatch record pointer), run its two
 * setup calls, then invoke its vtable's handler with a 5th stack arg.
 * Never returns except on an unexpected NULL message.
 */

typedef struct {
    void *f_0;
    int f_4;
    char _pad8[4];
    int f_c;
    int f_10;
} msg_t;

typedef struct {
    char _pad0[8];
    int f_8;
    char _pad_c[0x34 - 0xc];
    int (*f_34)(int, int, int, int, int);
    int f_38;
} vtable_t;

extern int data_021a520c;
extern int func_020924c0(void *q, void **out, int flags);
extern void func_020928cc(int a, int b);

void func_02088620(void) {
    void *msg;
    for (;;) {
        func_020924c0(&data_021a520c, &msg, 1);
        msg_t *m = msg;
        if (m == 0) {
            return;
        }
        func_020928cc(m->f_c, m->f_4);
        func_020928cc(m->f_10, m->f_4);
        vtable_t *vt = m->f_0;
        vt->f_34(m->f_c, m->f_10, m->f_4, vt->f_8, vt->f_38);
    }
}
