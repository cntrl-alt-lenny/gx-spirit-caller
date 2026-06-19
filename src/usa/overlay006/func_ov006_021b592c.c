/* func_ov006_021b592c: per-state "step" (short) — run the one fixed per-subobject
 * update, fire the per-state display-blank "enter", then advance the state word
 * to 1. Returns 1. The 8th state's step (struct 0224f38c), a trimmed sibling of
 * the 0x70 step family (ov006_core.h). */
extern void func_ov006_021c9de8(void *);
extern int  func_ov006_021b5824(void);
extern char data_ov006_0225df48[];
extern int  data_ov006_0224f26c[];
int func_ov006_021b592c(void) {
    func_ov006_021c9de8(data_ov006_0225df48);
    func_ov006_021b5824();
    data_ov006_0224f26c[0] = 1;
    return 1;
}
