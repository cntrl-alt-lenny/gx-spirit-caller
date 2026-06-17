/* func_02034524: C-42 — 7-helper void thunk.
 *
 *   push {r3, lr}
 *   bl func_02032638; bl func_0203315c; bl func_020322fc; bl func_020323a0
 *   bl func_02031e58; bl func_02032074; mov r0, #0; bl func_02034124; pop
 */

extern void func_02032638(void);
extern void func_0203315c(void);
extern void func_020322fc(void);
extern void func_020323a0(void);
extern void func_02031e58(void);
extern void func_02032074(void);
extern void func_02034124(int x);

void func_02034524(void) {
    func_02032638();
    func_0203315c();
    func_020322fc();
    func_020323a0();
    func_02031e58();
    func_02032074();
    func_02034124(0);
}
