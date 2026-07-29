/* Ov015_RegisterCallbacks: register the overlay's two callback records with the
 * host. (ov015_core.h) */
extern void func_0207f79c(void *);
extern void func_0207f774(void *);
extern char data_ov015_021b5ce4[];
extern char data_ov015_021b5cd0[];
void Ov015_RegisterCallbacks(void) {
    func_0207f79c(data_ov015_021b5ce4);
    func_0207f774(data_ov015_021b5cd0);
}
