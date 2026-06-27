/* Ov015_RegisterCallbacks: register the overlay's two callback records with the
 * host. (ov015_core.h) */
extern void func_0207f884(void *);
extern void func_0207f85c(void *);
extern char data_ov015_021b5e04[];
extern char data_ov015_021b5df0[];
void Ov015_RegisterCallbacks(void) {
    func_0207f884(data_ov015_021b5e04);
    func_0207f85c(data_ov015_021b5df0);
}
