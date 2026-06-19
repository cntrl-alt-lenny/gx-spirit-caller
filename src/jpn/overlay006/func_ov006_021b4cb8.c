/* func_ov006_021b4cb8: per-state "enter" (long) — kick the per-state full-init
 * (arg 1), seed the first subobject with (mode 5, 0), then run the seven fixed
 * per-subobject setup calls and advance the state word to 4. Returns 1. 0x80
 * enter family, sibling of 021b387c / 021b3e20 (ov006_core.h). */
extern void func_ov006_021b49d8(int);
extern void func_ov006_021b9df8(void *, int, int);
extern void func_ov006_021c1450(void *);
extern void func_ov006_021c6858(void *);
extern void func_ov006_021c7450(void *);
extern void func_ov006_021c9dc8(void *);
extern void func_ov006_021cab04(void *);
extern void func_ov006_021caf24(void *);
extern char data_ov006_0225c3bc[], data_ov006_0225ca3c[], data_ov006_0225dd50[],
            data_ov006_0225de1c[], data_ov006_0225df48[], data_ov006_0225dfe0[],
            data_ov006_0225e018[];
extern int  data_ov006_0224f1c8[];
int func_ov006_021b4cb8(void) {
    func_ov006_021b49d8(1);
    func_ov006_021b9df8(data_ov006_0225c3bc, 5, 0);
    func_ov006_021c1450(data_ov006_0225ca3c);
    func_ov006_021c6858(data_ov006_0225dd50);
    func_ov006_021c7450(data_ov006_0225de1c);
    func_ov006_021c9dc8(data_ov006_0225df48);
    func_ov006_021cab04(data_ov006_0225dfe0);
    func_ov006_021caf24(data_ov006_0225e018);
    data_ov006_0224f1c8[0] = 4;
    return 1;
}
