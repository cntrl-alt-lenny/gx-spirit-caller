/* func_ov006_021b549c: per-state "enter" — probe two subsystems, run the shared
 * setup pass over three subobjects interleaved with the two state-specific
 * init calls, then mark the status word ready (=6) iff both probes
 * succeeded. Returns the success bool. One of an 8-member family differing
 * only in (init_a, init_b, status, ready-value) (ov006_core.h §VERIFIED). */
extern int  func_ov006_021b9ff0(void *);
extern int  func_ov006_021c1498(void *);
extern void func_ov006_021c688c(void *);
extern void func_ov006_021ba0f0(void *);
extern void func_ov006_021c1544(void *);
extern void func_ov006_021c6930(void *);
extern void func_ov006_021b5218(void);
extern void func_ov006_021b5240(void);
extern char data_ov006_0225c3bc[];
extern char data_ov006_0225ca3c[];
extern char data_ov006_0225dd50[];
extern int  data_ov006_0224f210[];
int func_ov006_021b549c(void) {
    int a = func_ov006_021b9ff0(data_ov006_0225c3bc);
    int b = func_ov006_021c1498(data_ov006_0225ca3c);
    func_ov006_021c688c(data_ov006_0225dd50);
    func_ov006_021b5218();
    func_ov006_021ba0f0(data_ov006_0225c3bc);
    func_ov006_021c1544(data_ov006_0225ca3c);
    func_ov006_021c6930(data_ov006_0225dd50);
    func_ov006_021b5240();
    {
        int ok = a != 0 && b != 0;
        if (ok)
            data_ov006_0224f210[0] = 6;
        return ok;
    }
}
