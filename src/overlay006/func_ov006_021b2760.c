/* func_ov006_021b2760: ov006 cf140 state-handler variant — the same 7-call
 * teardown sequence as the family sibling func_ov006_021b2d5c (family-D
 * enter + the seven 0225xxxx subobject updates), but a flag-gated status
 * write instead of the plain state=5 tail: when data_ov006_0225c4dc's +0x44
 * field reads exactly 1, clear cf140[3] and set cf140[0]=5; any other value
 * sets cf140[0]=1 instead. */
extern void func_ov006_021cb0a0(void *p);
extern void func_ov006_021cac30(void *p);
extern void func_ov006_021c9ef4(void *p);
extern void func_ov006_021c757c(void *p);
extern void func_ov006_021c6990(void *p);
extern void func_ov006_021c159c(void *p);
extern void func_ov006_021ba090(void *p);
extern void func_ov006_021b2620(void);
extern char data_ov006_0225e138[], data_ov006_0225e100[], data_ov006_0225e068[], data_ov006_0225df3c[];
extern char data_ov006_0225de70[], data_ov006_0225cb5c[], data_ov006_0225c4dc[];
extern int  data_ov006_021cf140[];

int func_ov006_021b2760(void) {
    int flag = *(int *)(data_ov006_0225c4dc + 0x44);
    func_ov006_021cb0a0(data_ov006_0225e138);
    func_ov006_021cac30(data_ov006_0225e100);
    func_ov006_021c9ef4(data_ov006_0225e068);
    func_ov006_021c757c(data_ov006_0225df3c);
    func_ov006_021c6990(data_ov006_0225de70);
    func_ov006_021c159c(data_ov006_0225cb5c);
    func_ov006_021ba090(data_ov006_0225c4dc);
    func_ov006_021b2620();
    if (flag != 0 && flag == 1) {
        data_ov006_021cf140[3] = 0;
        data_ov006_021cf140[0] = 5;
    } else {
        data_ov006_021cf140[0] = 1;
    }
    return 1;
}
