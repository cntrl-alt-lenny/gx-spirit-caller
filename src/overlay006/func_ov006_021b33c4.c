/* func_ov006_021b33c4: per-state "enter" — probe two subsystems, run the shared
 * setup pass over three subobjects interleaved with the two state-specific
 * init calls, then mark the status word ready (=3) iff both probes succeeded.
 * Returns the success bool. One of an 8-member family differing only in
 * (init_a, init_b, status) (ov006_core.h §VERIFIED). */
extern int  func_ov006_021ba0f0(void *);
extern int  func_ov006_021c15a4(void *);
extern void func_ov006_021c6998(void *);
extern void func_ov006_021ba1f0(void *);
extern void func_ov006_021c1650(void *);
extern void func_ov006_021c6a3c(void *);
extern void func_ov006_021b3218(void);
extern void func_ov006_021b3240(void);
extern char data_ov006_0225c4dc[];
extern char data_ov006_0225cb5c[];
extern char data_ov006_0225de70[];
extern int  data_ov006_0224f1b0[];
int func_ov006_021b33c4(void) {
    int a = func_ov006_021ba0f0(data_ov006_0225c4dc);
    int b = func_ov006_021c15a4(data_ov006_0225cb5c);
    func_ov006_021c6998(data_ov006_0225de70);
    func_ov006_021b3218();
    func_ov006_021ba1f0(data_ov006_0225c4dc);
    func_ov006_021c1650(data_ov006_0225cb5c);
    func_ov006_021c6a3c(data_ov006_0225de70);
    func_ov006_021b3240();
    {
        int ok = a != 0 && b != 0;
        if (ok)
            data_ov006_0224f1b0[0] = 3;
        return ok;
    }
}
