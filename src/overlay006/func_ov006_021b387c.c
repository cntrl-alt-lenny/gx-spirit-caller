/* func_ov006_021b387c: per-state "enter" (long) — kick the per-state full-init
 * (arg 1), seed the first subobject with (mode 2, 0), then run the seven fixed
 * per-subobject setup calls and advance the state word to 4. Returns 1. 0x80
 * enter family, sibling of 021b3e20 / 021b4db8 (ov006_core.h). */
extern void func_ov006_021b359c(int);
extern void func_ov006_021b9ef8(void *, int, int);
extern void func_ov006_021c155c(void *);
extern void func_ov006_021c6964(void *);
extern void func_ov006_021c755c(void *);
extern void func_ov006_021c9ed4(void *);
extern void func_ov006_021cac10(void *);
extern void func_ov006_021cb030(void *);
extern char data_ov006_0225c4dc[], data_ov006_0225cb5c[], data_ov006_0225de70[],
            data_ov006_0225df3c[], data_ov006_0225e068[], data_ov006_0225e100[],
            data_ov006_0225e138[];
extern int  data_ov006_0224f1fc[];
int func_ov006_021b387c(void) {
    func_ov006_021b359c(1);
    func_ov006_021b9ef8(data_ov006_0225c4dc, 2, 0);
    func_ov006_021c155c(data_ov006_0225cb5c);
    func_ov006_021c6964(data_ov006_0225de70);
    func_ov006_021c755c(data_ov006_0225df3c);
    func_ov006_021c9ed4(data_ov006_0225e068);
    func_ov006_021cac10(data_ov006_0225e100);
    func_ov006_021cb030(data_ov006_0225e138);
    data_ov006_0224f1fc[0] = 4;
    return 1;
}
